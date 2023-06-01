import 'package:astdafa/layout/hagz/hagz.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class detilesapartment extends StatefulWidget {
  ApartmentModel apartmentModel;
  detilesapartment(this.apartmentModel);

  @override
  State<detilesapartment> createState() => _detilesapartmentState();
}

class _detilesapartmentState extends State<detilesapartment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(
                  height: 35.h,
                ),
                Image.asset(
                  "assets/images/astdafa.png",
                  width: 200.w,
                  height: 200.h,
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
                        return hagz();
                      }));
                    },
                    child:Text(
                      "حجز",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ]
              ),
            )
        )
    );
  }
}
