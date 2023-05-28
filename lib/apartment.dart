import 'package:astdafa/detelis_apartment.dart';
import 'package:astdafa/shkwa.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.symmetric(),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
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
                const SizedBox(
                  height: 30,
                ),
            MaterialButton(
                elevation: 5.0,
                color: Colors.red,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
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
          ])),
        ));
  }
}
