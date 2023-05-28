import 'package:astdafa/login.dart';
import 'package:astdafa/signin.dart';
import 'package:flutter/material.dart';
class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            const SizedBox(
              height: 150,
            ),
            Image.asset("assets/images/astdafa.png",
              width: 200,
              height: 200,
            ),
            MaterialButton(
                elevation: 5.0,
                color: Colors.lightGreen,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
                child: const Text("مرافق",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                }),
            const SizedBox(height: 20,),
            MaterialButton(
                elevation: 5.0,
                color: Colors.green,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
                child: const Text("مساهم",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const signinscreen();
                  }));
                }),
            const SizedBox(height: 20,),
          ])),
        ));
  }
}
