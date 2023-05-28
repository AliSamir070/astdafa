import 'package:astdafa/layout/account_ads/myapartment.dart';
import 'package:astdafa/layout/add_complain/shkwa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addapartment extends StatefulWidget {
  const addapartment({Key? key}) : super(key: key);

  @override
  State<addapartment> createState() => _addapartmentState();
}

class _addapartmentState extends State<addapartment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("إضافة الشقق"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: REdgeInsets.symmetric(
            horizontal: 28,
          ),
          width: MediaQuery.of(context).size.width,
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
                  hintText: "أدخل العنوان",
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
                  hintText: "أدخل تفاصيل",
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
                  hintText: "المنطقة",
                  prefixIcon: Icon(Icons.location_city),
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
                  hintText: "أضف صور الشقة",
                  prefixIcon: Icon(Icons.image),
                  enabledBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                  disabledBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                  focusedBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
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
                      return myapartment();
                    }));
                  },
                  child: Text(
                    "إنتهاء",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 20.h,
              ),
              MaterialButton(
                  elevation: 5.0,
                  color: Colors.red,
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
                      return const shkwa();
                    }));
                  },
                  child: Text(
                    "أضف شكوى",
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
