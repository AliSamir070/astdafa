import 'package:astdafa/layout/account_ads/cubit/my_apartment_cubit.dart';
import 'package:astdafa/layout/add_apartment/add_apartment.dart';
import 'package:astdafa/layout/edit_apartment/cubit/apartment_cubit.dart';
import 'package:astdafa/shared/apartment_component.dart';
import 'package:astdafa/shared/constants.dart';
import 'package:astdafa/shared/custom_not_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../model/ApartmentModel.dart';
import '../apartment_details/detelis_apartment.dart';
import '../edit_apartment/edit_apartment_ad_screen.dart';
import '../home/home.dart';

class myapartment extends StatefulWidget {
  const myapartment({Key? key}) : super(key: key);

  @override
  State<myapartment> createState() => _myapartmentState();
}

class _myapartmentState extends State<myapartment> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyApartmentCubit , MyApartmentState>(
      builder: (context , state){
        MyApartmentCubit myApartmentCubit = MyApartmentCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("إعلاناتي"),
            automaticallyImplyLeading: false,
            actions: [
              state is MyApartmentSignOutLoadingState
              ?SizedBox(
                height: 20.h,
                width: 20.w,
                child: const Center(child: CircularProgressIndicator(color: Colors.white,),),
              )
                  :IconButton(
                  onPressed: (){
                    myApartmentCubit.SignOut();
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
          body: state is MyApartmentsGetApartmentsLoadingState
          ?const Center(child: CircularProgressIndicator(),)
                :RefreshIndicator(
              onRefresh: ()async{
                await Future.delayed(const Duration(seconds: 1));
                myApartmentCubit.getMyApartmentsAds();
              },

              child: myApartmentCubit.apartments.isEmpty && state is! MyApartmentsGetApartmentsErrorState
                  ? CustomNoItems()
                  :BlocConsumer<EditApartmentCubit , EditApartmentStates>(
                  builder: (context , editstate){
                    return ListView.separated(
                        padding: REdgeInsets.all(16),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context , index)=>Slidable(
                          startActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                state is MyApartmentDeleteLoadingState
                                ?const Center(child: CircularProgressIndicator(),)
                                    : SlidableAction(
                                  onPressed: (context){
                                    myApartmentCubit.deleteAd(myApartmentCubit.apartments[index].id??"");
                                  },
                                  icon: Icons.delete_outline_rounded,
                                  label: "حذف",
                                  borderRadius: BorderRadius.circular(20.r),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.redAccent,
                                ),
                                SlidableAction(
                                  onPressed: (context){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>EditApartmentAdScreen(myApartmentCubit.apartments[index])
                                    )
                                    );
                                  },
                                  icon: Icons.edit,
                                  label: "تعديل",

                                  borderRadius: BorderRadius.circular(20.r),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.grey,
                                ),
                              ]
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return detilesapartment(myApartmentCubit.apartments[index],false);
                                },
                              ));
                            },
                            child: ApartmentComponent(
                                apartment: myApartmentCubit.apartments[index]
                            ),
                          ),
                        ),
                        separatorBuilder: (context , index)=>SizedBox(height: 20.h,),
                        itemCount: myApartmentCubit.apartments.length
                    );
                  },
                  listener: (context , state){}
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return addapartment();
                  },
                ),
              );
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 4.w, color: Colors.white),
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: const Icon(Icons.add),
          ),

        );
      },
      listener: (context , state){
        if(state is MyApartmentSignOutErrorState){
          showToast(state.error);
        }else if(state is MyApartmentSignOutSuccessState){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homescreen()));
          showToast(state.message);
        }else if(state is MyApartmentsGetApartmentsErrorState){
          showToast(state.error);
        }else if(state is MyApartmentsDeleteErrorState){
          showToast(state.error);
        }else if(state is MyApartmentsDeleteSuccessState){
          showToast(state.message);
        }
      },
    );

  }

  @override
  void initState() {
    super.initState();
    context.read<MyApartmentCubit>().getMyApartmentsAds();
  }

}
