import 'package:astdafa/database/model/user.dart';
import 'package:astdafa/database/my_database.dart';
import 'package:astdafa/home.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("التسجيل"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
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
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "First Name",
                  prefixIcon: const Icon(Icons.drive_file_rename_outline),
                  enabledBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                  disabledBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                  focusedBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "البريد الالكتروني",
                  prefixIcon: const Icon(Icons.email),
                  enabledBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                  disabledBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                  focusedBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "أدخل كلمة المرور",
                  prefixIcon: const Icon(Icons.password),
                  enabledBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                  disabledBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                  focusedBorder: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: "أدخل رقم الهاتف",
                  prefixIcon: const Icon(Icons.phone),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      )),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                elevation: 5.0,
                color: Colors.grey,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {
                  MyDataBase.addUser(
                    User(
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                        name: nameController.text),
                  ).then((value) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return homescreen();
                    }));
                  }, onError: (e) => print(e.toString()));
                },
                child: const Text(
                  "التسجيل",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
