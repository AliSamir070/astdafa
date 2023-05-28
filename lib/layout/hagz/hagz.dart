import 'package:astdafa/layout/apartments/apartment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class hagz extends StatefulWidget {
  const hagz({Key? key}) : super(key: key);

  @override
  State<hagz> createState() => _hagzState();
}

class _hagzState extends State<hagz> {
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
              TextField(
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
              TextField(
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
              MaterialButton(
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return apartment();
                    }));
                  },
                  child:Text(
                    "حجز",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
