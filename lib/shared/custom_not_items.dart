import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNoItems extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Text("ليس هناك اعلانات", style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          fontSize: 18.sp
        ),),
      ),
    );
  }
}
