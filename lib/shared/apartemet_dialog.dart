import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApartementDialog extends StatelessWidget {
  void Function() takeImageGallery;
  void Function() takeImageCamera;
  ApartementDialog({required this.takeImageCamera , required this.takeImageGallery});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: InkWell(
            onTap: takeImageGallery,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.image_outlined, size: 35.r,color: Colors.blue,)
                ,Text("الصور",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: takeImageCamera,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.camera_alt , size: 35.r,color: Colors.blue)
                ,Text("كاميرا",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void showApartmentDialog({required BuildContext context , required void Function() takeImageGallery,required void Function() takeImageCamera}){
  showDialog(context: context, builder:(context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0.r))),
      alignment: Alignment.bottomCenter,
      content: ApartementDialog(
      takeImageCamera: takeImageCamera,
      takeImageGallery: takeImageGallery
),
    );
  });
}