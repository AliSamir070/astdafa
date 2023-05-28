import 'package:astdafa/hagz.dart';
import 'package:flutter/material.dart';

class detilesapartment extends StatefulWidget {
  const detilesapartment({Key? key}) : super(key: key);

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
                const SizedBox(
                  height: 35,
                ),
                Image.asset(
                  "assets/images/astdafa.png",
                  width: 200,
                  height: 200,
                ),
                MaterialButton(
                    elevation: 5.0,
                    color: Colors.grey,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 80,
                    ),
                    child: const Text(
                      "حجز",
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
                        return hagz();
                      }));
                    }),
              ]
              ),
            )
        )
    );
  }
}
