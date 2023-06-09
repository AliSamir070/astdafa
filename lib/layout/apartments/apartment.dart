import 'package:astdafa/layout/apartment_details/detelis_apartment.dart';
import 'package:astdafa/layout/add_complain/shkwa.dart';
import 'package:astdafa/layout/apartments/cubit/apartments_cubit.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:astdafa/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/apartment_component.dart';
import '../../shared/custom_not_items.dart';
import '../../shared/prefs_helper.dart';
import '../home/home.dart';

class apartment extends StatefulWidget {
  const apartment({Key? key}) : super(key: key);

  @override
  State<apartment> createState() => _apartmentState();
}

class _apartmentState extends State<apartment> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ApartmentsCubit()..getMyApartmentsAds(),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text("الشقق المتاحة"),
            actions: [
              IconButton(
                  onPressed: (){
                    PrefsHelper.clearCode();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homescreen()));
                  },
                  icon: Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.white,
                    size: 20.r,
                  )
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: BlocConsumer<ApartmentsCubit , ApartmentsState>(
              builder: (context , state){
                ApartmentsCubit apartmentsCubit = ApartmentsCubit.get(context);
                return state is ApartmentGetAllApartmentsLoadingState
                    ?const Center(child: CircularProgressIndicator(),)
                    :RefreshIndicator(
                    onRefresh: ()async{
                      await Future.delayed(const Duration(seconds: 1));
                      apartmentsCubit.getMyApartmentsAds();
                    },

                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          children: [
                            Expanded(
                                child: apartmentsCubit.apartments.isEmpty && state is! ApartmentGetAllApartmentsErrorState
                                    ? CustomNoItems()
                                    :ListView.separated(
                                    padding: REdgeInsets.only(
                                      bottom: 110,
                                      left: 16,
                                      right: 16,
                                      top: 16
                                    ),
                                    physics: const AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context , index)=>InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) {
                                            return detilesapartment(apartmentsCubit.apartments[index],true);
                                          },
                                        ));
                                      },
                                      child: ApartmentComponent(
                                          apartment: apartmentsCubit.apartments[index]
                                      ),
                                    ),
                                    separatorBuilder: (context , index)=>SizedBox(height: 20.h,),
                                    itemCount: apartmentsCubit.apartments.length
                                )
                            ),
                          ],
                        ),
                        Container(
                          margin: REdgeInsets.symmetric(vertical: 20),
                          child: MaterialButton(
                              elevation: 5.0,
                              color: Colors.red,
                              padding: REdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 40,
                              ),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide: BorderSide.none,
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const shkwa();
                                }));
                              },
                              child: Text(
                                "أضف شكوى",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ));
              },
              listener: (context , state){
                if(state is ApartmentGetAllApartmentsErrorState){
                  showToast(state.error);
                }
              }
          )
      ),
    );
  }
}
