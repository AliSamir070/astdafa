import 'package:astdafa/layout/account_ads/cubit/my_apartment_cubit.dart';
import 'package:astdafa/layout/add_apartment/add_apartment.dart';
import 'package:astdafa/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/home.dart';

class myapartment extends StatefulWidget {
  const myapartment({Key? key}) : super(key: key);

  @override
  State<myapartment> createState() => _myapartmentState();
}

class _myapartmentState extends State<myapartment> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MyApartmentCubit(),
      child: BlocConsumer<MyApartmentCubit , MyApartmentState>(
        builder: (context , state){
          MyApartmentCubit myApartmentCubit = MyApartmentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("إعلاناتي"),
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
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const SingleChildScrollView(),
            ),
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
            showToast(state.message);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homescreen()));
          }
        },
      ),
    );

  }
}
