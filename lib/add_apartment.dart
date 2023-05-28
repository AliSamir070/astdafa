import 'package:astdafa/myapartment.dart';
import 'package:astdafa/shkwa.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              Image.asset(
                "assets/images/astdafa.png",
                width: 200,
                height: 200,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "أدخل العنوان",
                  prefixIcon: Icon(Icons.subject),
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
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "أدخل تفاصيل",
                  prefixIcon: Icon(Icons.subject),
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
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "المنطقة",
                  prefixIcon: Icon(Icons.location_city),
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
              const SizedBox(
                height: 20,
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
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                  elevation: 5.0,
                  color: Colors.grey,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 80,
                  ),
                  child: const Text(
                    "إنتهاء",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return myapartment();
                    }));
                  }),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                  elevation: 5.0,
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 80,
                  ),
                  child: const Text(
                    "أضف شكوى",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const shkwa();
                    }));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
