import 'package:astdafa/model/ApartmentModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class ApartmentComponent extends StatelessWidget {
  ApartmentModel apartment;
  ApartmentComponent({required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: apartment.isReserved??false
          ?RotatedCornerDecoration.withColor(
          color: const Color(0xff212A3E),
          badgeSize: Size(35.w, 35.h),
          badgeCornerRadius: Radius.circular(20.r),
          badgePosition: BadgePosition.topEnd,
          textDirection: TextDirection.rtl,
          textSpan: TextSpan(
              text: "محجوز",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.bold
              )
          ),

      )
          :null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          apartment.photos==null || apartment.photos!.isEmpty
                ?Container(
                width: 100.w,
                height: 100.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 2.w
                    ),
                    borderRadius: BorderRadius.circular(20.r)
                ),
                child: Text(
                  "لا صورة",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp
                  ),
                ),
              )
              :CachedNetworkImage(
              imageUrl: apartment.photos![0],
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            imageBuilder: (context , provider)=>Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                image: DecorationImage(image: provider,fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20.r)
              ),
            ),
            errorWidget: (context , url , error)=>Container(
              width: 100.w,
              height: 100.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 2.w
                  ),
                  borderRadius: BorderRadius.circular(20.r)
              ),
              child: Text(
                "لا صورة",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp
                ),
              ),
            ),
            placeholder: (context , url)=>Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.w
                ),
                  borderRadius: BorderRadius.circular(20.r)
              ),
              child: Center(
                child: SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: SizedBox(
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    apartment.describtion??"بدون وصف",
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(
                                apartment.name??"بدون اسم",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                ),
                                textDirection: TextDirection.rtl,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10.w,),
                            SvgPicture.asset(
                              "assets/images/house.svg",
                              height: 20.h,
                              width: 20.w,
                              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(
                                apartment.location??"بدون عنوان",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp
                                ),
                                textDirection: TextDirection.rtl,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10.w,),
                            SvgPicture.asset(
                              "assets/images/location.svg",
                              height: 20.h,
                              width: 20.w,
                              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
