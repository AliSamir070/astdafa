import 'package:astdafa/layout/msahma_forgot_passowrd/forget_the_password.dart';
import 'package:astdafa/layout/account_ads/myapartment.dart';
import 'package:astdafa/layout/msahma_signin/cubit/msahma_sign_in_cubit.dart';
import 'package:astdafa/layout/msahma_signup/signup.dart';
import 'package:astdafa/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../database_helper/my_database.dart';
import '../../shared/custom_loading.dart';

class signinscreen extends StatefulWidget {
  const signinscreen({Key? key}) : super(key: key);

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MsahmaSignInCubit(),
      child: Scaffold(
        body: Container(
          padding: REdgeInsets.symmetric(
            horizontal: 28,
          ),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/astdafa.png",
                      width: 200.w,
                      height: 200.h,
                    ),
                    TextFormField(
                      validator: validateEmail,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "ادخل البريد الإلكتروني",
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: (OutlineInputBorder(
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
                        disabledBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.w,
                            ))),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      validator: validatePassword,
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "أدخل كلمة المرور",
                        prefixIcon: const Icon(Icons.password),
                        enabledBorder: (OutlineInputBorder(
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
                        disabledBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.w,
                            ))),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ),
                        ),
                      ),
                    ),
                   SizedBox(
                      height: 20.h,
                    ),
                    BlocConsumer<MsahmaSignInCubit , MsahmaSignInState>(
                        builder: (context , state){
                          MsahmaSignInCubit msahmaSignInCubit = MsahmaSignInCubit.get(context);
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
                                msahmaSignInCubit.signIn(formKey, emailController.text, passwordController.text);
                              },
                              child: state is MsahmaSignInLoadingState?CustomLoading():Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold),
                              ));
                        },
                        listener: (context , state){
                          if(state is MsahmaSignInSuccessState){
                            showToast(state.message);
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) {
                              return myapartment();
                            }));
                          }else if(state is MsahmaSignInErrorState){
                            showToast(state.error);
                          }
                        }
                    ),
                   SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const forgetthepassword();
                        }));
                      },
                      child: Text(
                        "هل نسيت كلمة المرور؟",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const signup();
                        }));
                      },
                      child: Text(
                        "التسجيل",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
