import 'package:astdafa/layout/apartments/apartment.dart';
import 'package:astdafa/layout/hagz/cubit/hagz_cubit.dart';
import 'package:astdafa/layout/home/home.dart';
import 'package:astdafa/shared/constants.dart';
import 'package:astdafa/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/prefs_helper.dart';

class hagz extends StatefulWidget {
  String apartmmentId;
  hagz(this.apartmmentId);

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
    return BlocProvider(
      create: (context)=>HagzCubit(),
      child: Scaffold(
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
                                      nameController.text, phoneController.text,
                                      widget.apartmmentId);
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
                          PrefsHelper.clearCode();
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (context)=>homescreen()
                          ), (route) => false);
                        }else if(state is HagzApartmentErrorState){
                          showToast(state.error);
                        }
                      }
                  ),
                ],
              ),
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
