import 'package:astdafa/layout/msahma_forgot_passowrd/cubit/forgot_password_cubit.dart';
import 'package:astdafa/layout/msahma_forgot_passowrd/next_step_forget.dart';
import 'package:astdafa/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../shared/constants.dart';
class forgetthepassword extends StatefulWidget {
  const forgetthepassword({Key? key}) : super(key: key);
  @override
  State<forgetthepassword> createState() => _forgetthepasswordState();
}
class _forgetthepasswordState extends State<forgetthepassword> {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ForgotPasswordCubit(),
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: const Text("نسيت كلمة المرور"),
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
                  Image.asset("assets/images/astdafa.png",
                    width: 200.w,
                    height: 200.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("ادخل البريد الالكتروني الخاص بك في استضافة وسيتم ارسال رسالة تستطيع من خلاله تغير كلمة المرور ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp
                  ),),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "أدخل بريدك الإلكتروني",
                      prefixIcon: Icon(Icons.email),
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
                  BlocConsumer<ForgotPasswordCubit , ForgotPasswordState>(
                      builder: (context , state){
                        ForgotPasswordCubit forgotCubit = ForgotPasswordCubit.get(context);
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
                             if(state is! ForgotPasswordLoadingState && state is! ForgotPasswordSuccessState){
                               if(formKey.currentState!.validate()){
                                  forgotCubit.forgotPasswordEmail(emailController.text);
                               }
                             }
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                state is ForgotPasswordSuccessState?Countdown(
                                  seconds: 60,
                                  build: (BuildContext context, double time) => Text(
                                      time.round().toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold),
                                  ),
                                  interval: const Duration(milliseconds: 1000),
                                  onFinished: () {
                                    forgotCubit.FinishTimer();
                                  },
                                ):SizedBox(),
                                state is ForgotPasswordLoadingState
                                ?CustomLoading()
                                    :Text(
                                  "ارسال",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        );
                      },
                      listener: (context , state){
                        if(state is ForgotPasswordSuccessState){
                          showToast(state.message);
                        }else if(state is ForgotPasswordErrorState){
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