import 'package:astdafa/layout/apartments/apartment.dart';
import 'package:astdafa/layout/morafk_login/cubit/morafk_login_cubit.dart';
import 'package:astdafa/shared/constants.dart';
import 'package:astdafa/shared/custom_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController codeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MorafkLoginCubit(),
      child: Scaffold(
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
                    height: 150.h,
                  ),
                  Image.asset(
                    "assets/images/astdafa.png",
                    width: 200.w,
                    height: 200.h,
                  ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: validatePhone,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11)
                    ],
                    decoration: InputDecoration(
                      hintText: "ادخل رقم هاتفك",
                      prefixIcon: const Icon(Icons.phone),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        ),
                      ),
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
                    validator: validateCode,
                    controller: codeController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5)
                    ],
                    decoration: InputDecoration(
                      hintText: "أدخل الكود",
                      prefixIcon: const Icon(Icons.code),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide:  BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide:  BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide:  BorderSide(
                          color: Colors.grey,
                          width: 1.w,
                        ),
                      ),
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
                  BlocConsumer<MorafkLoginCubit , MorafkLoginState>(
                      builder: (context , state){
                        MorafkLoginCubit morafkCubit = MorafkLoginCubit.get(context);
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
                            if(state is! MorafkLoginLoadingState) {
                              morafkCubit.login(formKey, codeController.text,
                                  phoneController.text);
                            }
                          },
                          child:state is MorafkLoginLoadingState
                          ?CustomLoading()
                              :Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      listener: (context , state){
                        if(state is MorafkLoginErrorState){
                          showToast(state.error);
                        }else if(state is MorafkLoginSuccessState){
                          showToast(state.message);
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                            return const apartment();
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
  String? validateCode(String? value){
    if(value!.isEmpty){
      return "يجب ادخاله";
    } else if( !Constants.codeRegex.hasMatch(value)){
      return "كود غير صحيح";
    }else {
      return null;
    }
  }
}
