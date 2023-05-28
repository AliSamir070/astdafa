import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(
        color: Colors.white,
        size: 30.r);
  }
}
