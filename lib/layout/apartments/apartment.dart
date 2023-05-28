import 'package:astdafa/layout/apartment_details/detelis_apartment.dart';
import 'package:astdafa/layout/add_complain/shkwa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class apartment extends StatefulWidget {
  const apartment({Key? key}) : super(key: key);

  @override
  State<apartment> createState() => _apartmentState();
}

class _apartmentState extends State<apartment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("الشقق المتاحة"),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: REdgeInsets.symmetric(),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const detilesapartment();
                  },
                ));
              },
              child: Image.asset("assets/images/example.jpeg"),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const detilesapartment();
                  },
                ));
              },
              child: Image.asset("assets/images/example1.jpeg"),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const detilesapartment();
                  },
                ));
              },
              child: Image.asset("assets/images/example2.jpeg"),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const detilesapartment();
                  },
                ));
              },
              child: Image.asset("assets/images/example3.jpeg"),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const detilesapartment();
                  },
                ));
              },
              child: Image.asset("assets/images/example4.jpeg"),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const detilesapartment();
                  },
                ));
              },
              child: Image.asset("assets/images/example5.jpeg"),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const detilesapartment();
                  },
                ));
              },
              child: Image.asset("assets/images/example6.jpeg"),
            ),
                SizedBox(
                  height: 30.h,
                ),
            MaterialButton(
                elevation: 5.0,
                color: Colors.red,
                padding: REdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
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
                child:Text(
                  "أضف شكوى",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                )),
          ])),
        ));
  }
}
