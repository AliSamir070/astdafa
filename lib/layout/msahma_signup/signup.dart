import 'package:astdafa/authentication_handler/authentication_handler.dart';
import 'package:astdafa/layout/account_ads/myapartment.dart';
import 'package:astdafa/layout/home/home.dart';
import 'package:astdafa/layout/msahma_signup/cubit/msahma_sign_up_cubit.dart';
import 'package:astdafa/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../database_helper/my_database.dart';
import '../../model/user.dart';
import '../../shared/constants.dart';
import '../../shared/prefs_helper.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MsahmaSignUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("التسجيل"),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: REdgeInsets.symmetric(
            horizontal: 18,
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
                  ),
                  TextFormField(
                    validator: validateName,
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "الاسم",
                      prefixIcon: const Icon(Icons.drive_file_rename_outline),
                      enabledBorder: (OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ))),
                      disabledBorder: (OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ))),
                      focusedBorder: (OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
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
                    ),
                  ),
                   SizedBox(height: 20.h),
                  TextFormField(
                    validator: validateEmail,
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "البريد الالكتروني",
                      prefixIcon: const Icon(Icons.email),
                      enabledBorder: (OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ))),
                      disabledBorder: (OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ))),
                      focusedBorder: (OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
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
                    ),
                  ),
                   SizedBox(height: 20.h),
                  TextFormField(
                    validator: validatePassword,
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "أدخل كلمة المرور",
                      prefixIcon:  const Icon(Icons.password),
                      enabledBorder: (OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ))),
                      disabledBorder: (OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ))),
                      focusedBorder: (OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
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
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    validator: validatePhone,
                    controller: phoneController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11)
                    ],
                    decoration: InputDecoration(
                      hintText: "أدخل رقم الهاتف",
                      prefixIcon: const Icon(Icons.phone),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          )),
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
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:  BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          )),
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<MsahmaSignUpCubit , MsahmaSignUpState>(
                      builder: (context , state){
                        MsahmaSignUpCubit cubit = MsahmaSignUpCubit.get(context);
                        return MaterialButton(
                          elevation: 5.0,
                          color: Colors.grey,
                          padding: REdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 80,
                          ),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            borderSide: BorderSide.none,
                          ),
                          onPressed: () {
                            if(state is! MsahmaSignUpLoadingState) {
                              cubit.signUp(
                                  formKey,
                                  nameController.text,
                                  emailController.text,
                                  phoneController.text,
                                  passwordController.text);
                            }
                          },
                          child: state is MsahmaSignUpLoadingState
                          ?CustomLoading()
                              :Text(
                            "التسجيل",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      listener: (context , state){
                        if(state is MsahmaSignUpErrorState){
                          showToast(state.error);
                        }else if(state is MsahmaSignUpSuccessState){
                          showToast(state.message);
                          PrefsHelper.setData(key: "phone", value: state.user.phone);
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) {
                            return myapartment();
                          }));
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
  String? validateName(String? value){
    if(value!.isEmpty){
      return "يجب ادخاله";
    } else {
      return null;
    }
  }
  String? validatePassword(String? value){
    if(value!.isEmpty){
      return "يجب ادخاله";
    } else if(value.length < 8){
      return "رقم المرور قصير";
    } else {
      return null;
    }
  }
  String? validateEmail(String? value) {
    if(value!.isEmpty){
      return "يجب ادخاله";
    }
    String pattern = Constants.emailRegix ;
    final regex = RegExp(pattern);

    return value.isNotEmpty && !regex.hasMatch(value)
        ? "غير صحيح"
        : null;
  }
}
