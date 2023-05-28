import 'package:astdafa/database/my_database.dart';
import 'package:astdafa/forget_the_password.dart';
import 'package:astdafa/myapartment.dart';
import 'package:astdafa/signup.dart';
import 'package:flutter/material.dart';

class signinscreen extends StatefulWidget {
  const signinscreen({Key? key}) : super(key: key);

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/astdafa.png",
                    width: 200,
                    height: 200,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "ادخل البريد الإلكتروني",
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
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
                        MyDataBase.readUser(
                                emailController.text, passwordController.text)
                            .then((value) {
                          if (value != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const myapartment();
                                },
                              ),
                            );
                          }else{
                            print('ليس لديك حساب');
                          }
                        }, onError: (e) => print(e.toString()));
                      },
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const forgetthepassword();
                      }));
                    },
                    child: const Text(
                      "هل نسيت كلمة المرور؟",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const signup();
                      }));
                    },
                    child: const Text(
                      "التسجيل",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
