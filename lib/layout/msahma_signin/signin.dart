import 'package:astdafa/layout/msahma_forgot_passowrd/forget_the_password.dart';
import 'package:astdafa/layout/account_ads/myapartment.dart';
import 'package:astdafa/layout/msahma_signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../database_helper/my_database.dart';

class signinscreen extends StatefulWidget {
  const signinscreen({Key? key}) : super(key: key);

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: REdgeInsets.symmetric(
          horizontal: 28,
        ),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/astdafa.png",
                    width: 200.w,
                    height: 200.h,
                  ),
                  TextFormField(
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
                  MaterialButton(
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
                        MyDataBase.readUser(
                                emailController.text, passwordController.text)
                            .then((value) {
                          if (value != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const myapartment();
                                },
                              ),
                            );
                          }else{
                            print('ليس لديك حساب');
                          }
                        }, onError: (e) => print(e.toString()));
                      },
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold),
                      )),
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
    );
  }
}
