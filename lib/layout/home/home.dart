import 'package:astdafa/layout/morafk_login/login.dart';
import 'package:astdafa/layout/msahma_signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class homescreen extends StatelessWidget {
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
              child: Column(children: <Widget>[
            SizedBox(
              height: 150.h,
            ),
            Image.asset("assets/images/astdafa.png",
              width: 200.w,
              height: 200.h,
            ),
            MaterialButton(
                elevation: 5.0,
                color: Colors.lightGreen,
                padding: REdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                child: Text("مرافق",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 20.h,),
            MaterialButton(
                elevation: 5.0,
                color: Colors.green,
                padding: REdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const signinscreen();
                  }));
                },
                child: Text("مساهم",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 20.h,),
          ])),
        ));
  }
}
