import 'package:astdafa/layout/add_apartment/add_apartment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class myapartment extends StatefulWidget {
  const myapartment({Key? key}) : super(key: key);

  @override
  State<myapartment> createState() => _myapartmentState();
}

class _myapartmentState extends State<myapartment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("إعلاناتي"),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const SingleChildScrollView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return addapartment();
              },
            ),
          );
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 4.w, color: Colors.white),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: const Icon(Icons.add),
      ),

    );

  }
}
