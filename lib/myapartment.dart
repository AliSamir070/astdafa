import 'package:astdafa/add_apartment.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(),
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
          side: const BorderSide(width: 4, color: Colors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.add),
      ),

    );

  }
}
