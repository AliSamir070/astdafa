import 'package:astdafa/layout/apartments/apartment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: REdgeInsets.symmetric(
          horizontal: 28,
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
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
              TextField(
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
              TextField(
                controller: emailController,
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

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const apartment();
                  }));
                },
                child:Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
