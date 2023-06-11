import 'package:astdafa/layout/apartments/apartment.dart';
import 'package:astdafa/layout/hagz/cubit/hagz_cubit.dart';
import 'package:astdafa/layout/home/home.dart';
import 'package:astdafa/shared/constants.dart';
import 'package:astdafa/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../model/ApartmentModel.dart';
import '../../shared/prefs_helper.dart';

class hagz extends StatefulWidget {
  ApartmentModel apartmentModel;
  hagz(this.apartmentModel);

  @override
  State<hagz> createState() => _hagzState();
}

class _hagzState extends State<hagz> {
  late TextEditingController phoneController;
  late TextEditingController nameController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الحجز"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: REdgeInsets.symmetric(
          horizontal: 28,
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 25.h,
                ),
                Image.asset(
                  "assets/images/astdafa.png",
                  width: 200.w,
                  height: 200.h,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "يجب ادخاله";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "الإسم",
                    prefixIcon: Icon(Icons.subject),
                    enabledBorder: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0.w,
                        ))),
                    disabledBorder: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0.w,
                        ))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide:  BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide:  BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        )),
                    focusedBorder: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0.w,
                        ))),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: validatePhone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11)
                  ],
                  decoration: InputDecoration(
                    hintText: "أدخل رقم الهاتف",
                    prefixIcon: Icon(Icons.phone),
                    enabledBorder: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        ))),
                    disabledBorder: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        ))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide:  BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide:  BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        )),
                    focusedBorder: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        ))),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocConsumer<HagzCubit , HagzState>(
                    builder: (context , state){
                      HagzCubit hagzCubit = HagzCubit.get(context);
                      return Container(
                        width: 300.w,
                        height: 200.h,
                        padding: REdgeInsetsDirectional.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap:(){
                                  showDatePicker(

                                    context: context,
                                    builder: (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: Colors.black,
                                          colorScheme: const ColorScheme.light(primary: Colors.black, onPrimary: Colors.white),
                                          buttonTheme: ButtonThemeData(
                                            textTheme: ButtonTextTheme.primary,
                                            buttonColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        ),
                                        child: child ?? Container(),
                                      );
                                    },
                                    initialDate: hagzCubit.checkIn,
                                    firstDate: DateTime.now(),
                                    lastDate: hagzCubit.checkIn.add(const Duration(days: 30)),

                                  ).then((value){
                                    hagzCubit.changeCheckInDate(newCheckIn: value);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'بداية الحجز',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                          DateFormat.d("ar").format(hagzCubit.checkIn),
                                          style:TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          )
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        DateFormat.MMM("ar").format(hagzCubit.checkIn),
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        DateFormat.y("ar").format(hagzCubit.checkIn),
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w,),
                            Icon(
                              Icons.calendar_month,
                              size: 30.r,
                            ),
                            SizedBox(width: 20.w,),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  showDatePicker(
                                    builder: (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: Colors.black,
                                          colorScheme: const ColorScheme.light(primary: Colors.black, onPrimary: Colors.white),
                                          buttonTheme: ButtonThemeData(
                                            textTheme: ButtonTextTheme.primary,
                                            buttonColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        ),
                                        child: child ?? Container(),
                                      );
                                    },
                                    context: context,
                                    initialDate: hagzCubit.checkOut,
                                    firstDate: hagzCubit.checkIn.add(const Duration(days: 1)),
                                    lastDate: hagzCubit.checkOut.add(const Duration(days: 31)),

                                  ).then((value){
                                    hagzCubit.changeCheckOutDate(newCheckOut: value);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'انتهاء الحجز',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                          DateFormat.d("ar").format(hagzCubit.checkOut),
                                          style:TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          )
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        DateFormat.MMM("ar").format(hagzCubit.checkOut),
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        DateFormat.y("ar").format(hagzCubit.checkOut),
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    listener: (context , state){

                    }
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocConsumer<HagzCubit , HagzState>(
                    builder: (context , state){
                      HagzCubit hagzCubit = HagzCubit.get(context);
                      return MaterialButton(
                          elevation: 5.0,
                          color: Colors.grey,
                          padding: REdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 80,
                          ),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            borderSide: BorderSide.none,
                          ),
                          onPressed: () {
                            if(state is! HagzApartmentLoadingState) {
                              if (formKey.currentState!.validate()) {
                                hagzCubit.addHagz(
                                    nameController.text,
                                    phoneController.text,
                                    widget.apartmentModel.id??"",
                                    widget.apartmentModel
                                );
                              }
                            }
                          },
                          child:state is HagzApartmentLoadingState
                          ?CustomLoading()
                            :Text(
                            "حجز",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ));
                    },
                    listener: (context , state){
                      if(state is HagzApartmentSuccessState){
                        showToast(state.message);
                        Navigator.pop(context);
                      }else if(state is HagzApartmentErrorState){
                        showToast(state.error);
                      }
                    }
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  String? validatePhone(String? value){
    if(value!.isEmpty){
      return "يجب ادخاله";
    } else if(value.length < 11){
      return "غير صحيح";
    }else if(!value.startsWith("011") && !value.startsWith("010") && !value.startsWith("012") && !value.startsWith("015")){
      return "غير صحيح";
    } else {
      return null;
    }
  }
}
