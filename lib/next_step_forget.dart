import 'package:astdafa/home.dart';
import 'package:flutter/material.dart';

class nextstepforget extends StatefulWidget {
  const nextstepforget({Key? key}) : super(key: key);

  @override
  State<nextstepforget> createState() => _nextstepforgetState();
}

class _nextstepforgetState extends State<nextstepforget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("نسيت كلمة المرور"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
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
                  hintText: "أدخل الكود",
                  prefixIcon: Icon(Icons.code),
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
                  hintText: "أدخل كلمة المرور الجديدة",
                  prefixIcon: Icon(Icons.password),
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
                  hintText: "تأكيد كلمة المرور الجديدة",
                  prefixIcon: Icon(Icons.password),
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
                    vertical: 20,
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
                      return homescreen();
                    }));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
