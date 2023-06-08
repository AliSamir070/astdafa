import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../authentication_handler/authentication_handler.dart';
import '../layout/account_ads/myapartment.dart';
import '../layout/home/home.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/lottie/splash.json',

          fit: BoxFit.fill,
          controller:_controller,
          onLoaded: (composition){
            _controller..duration = composition.duration..forward().whenComplete((){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context)=>AuthHandler.getUser()==null?homescreen():myapartment()
              )
              );
            });

          }
        ),
      ),
    );
  }
}
