import 'package:astdafa/layout/hagz/cubit/hagz_cubit.dart';
import 'package:astdafa/layout/hagz/hagz.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:astdafa/shared/constants.dart';
import 'package:astdafa/shared/prefs_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class detilesapartment extends StatefulWidget {
  ApartmentModel apartmentModel;
  bool isMorafk;
  detilesapartment(this.apartmentModel, this.isMorafk);

  @override
  State<detilesapartment> createState() => _detilesapartmentState();
}

class _detilesapartmentState extends State<detilesapartment> {
  final _scrollController = ScrollController();
  bool _isAppBarExpanded = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarExpanded = _scrollController.offset < 210.h;
        print(_isAppBarExpanded);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<HagzCubit , HagzState>(
          builder: (context , state){
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  snap: true,
                  floating: true,
                  expandedHeight: 300.h,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20.r,
                      color: _isAppBarExpanded?Colors.white:Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  backgroundColor: _isAppBarExpanded ? Colors.transparent : Colors.white,
                  elevation: _isAppBarExpanded ? 0 : 4,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        widget.apartmentModel.photos==null || widget.apartmentModel.photos!.isEmpty
                            ?Container(
                          width: double.infinity,
                          height:200.h ,
                          color: Colors.black,
                          alignment: Alignment.center,
                          child: Text(
                            "لا يوجد صورة",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp
                            ),
                          ),
                        )
                            :CarouselSlider.builder(
                          itemBuilder: (context , index , value){

                            return CachedNetworkImage(
                              imageUrl: widget.apartmentModel.photos![index],
                              height: 300.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context , url)=>const Center(child: CircularProgressIndicator(),),
                              errorWidget: (context , url,error)=>Container(
                                width: double.infinity,
                                height:300.h ,
                                child: Text(
                                  "لا يوجد صورة",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: widget.apartmentModel.photos!.length,
                          options: CarouselOptions(
                              height: 300.h,
                              initialPage: 0,
                              pauseAutoPlayInFiniteScroll: true,
                              enableInfiniteScroll: false,

                              autoPlay: true,
                              autoPlayAnimationDuration: Duration(milliseconds: 500),
                              autoPlayInterval: Duration(seconds: 15),
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              viewportFraction: 1
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: REdgeInsets.all(16.0),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: ui.TextDirection.rtl,
                          children: [
                            SvgPicture.asset(
                              "assets/images/person.svg",
                              height: 25.h,
                              width: 25.w,
                              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            ),
                            SizedBox(width: 10.w,),
                            Flexible(
                              child: Text(
                                "اسم صاحب الاعلان",
                                style: TextStyle(
                                    fontSize:20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff212A3E)
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          widget.apartmentModel.name??"بدون اسم",
                          style: TextStyle(
                            fontSize:16.sp,
                          ),
                        ),
                        SizedBox(
                          height:30.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: ui.TextDirection.rtl,
                          children: [
                            SvgPicture.asset(
                              "assets/images/details.svg",
                              height: 25.h,
                              width: 25.w,
                              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            ),
                            SizedBox(width: 10.w,),
                            Flexible(
                              child: Text(
                                "التفاصيل",
                                style: TextStyle(
                                    fontSize:20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff212A3E)
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          widget.apartmentModel.describtion??"ليس هناك تفاصيل",
                          style: TextStyle(
                            fontSize:16.sp,
                          ),
                        ),
                        SizedBox(
                          height:30.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: ui.TextDirection.rtl,
                          children: [
                            SvgPicture.asset(
                              "assets/images/location.svg",
                              height: 25.h,
                              width: 25.w,
                              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            ),
                            SizedBox(width: 10.w,),
                            Flexible(
                              child: Text(
                                "عنوان",
                                style: TextStyle(
                                    fontSize:20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff212A3E)
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          widget.apartmentModel.address??"ليس هناك عنوان",
                          style: TextStyle(
                            fontSize:16.sp,
                          ),
                        ),
                        SizedBox(
                          height:30.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: ui.TextDirection.rtl,
                          children: [
                            SvgPicture.asset(
                              "assets/images/location.svg",
                              height: 25.h,
                              width: 25.w,
                              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            ),
                            SizedBox(width: 10.w,),
                            Text(
                              "منطقة",
                              style: TextStyle(
                                  fontSize:20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff212A3E)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          widget.apartmentModel.location??"ليس هناك منطقة",
                          style: TextStyle(
                            fontSize:16.sp,
                          ),
                        ),
                        if(widget.apartmentModel.isReserved??false)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height:20.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                textDirection: ui.TextDirection.rtl,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/check.svg",
                                    height: 25.h,
                                    width: 25.w,
                                    colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Text(
                                    "تفاصيل الحجز",
                                    style: TextStyle(
                                        fontSize:20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff212A3E)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Container(
                                padding: REdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10.r)

                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "الاسم : ${widget.apartmentModel.reservation?.name}",
                                      textDirection: ui.TextDirection.rtl,
                                      style: TextStyle(

                                          fontSize:16.sp,
                                          color: Color(0xff212A3E)
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Text(
                                      " رقم التليفون : ${widget.apartmentModel.reservation?.phone}",
                                      textDirection: ui.TextDirection.rtl,
                                      style: TextStyle(
                                          fontSize:16.sp,

                                          color: Color(0xff212A3E)
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Row(
                                      textDirection: ui.TextDirection.rtl,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "من : ${DateFormat.yMd("ar").format(widget.apartmentModel.reservation!.from!)}",
                                            textDirection: ui.TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize:16.sp,
                                                color: const Color(0xff212A3E)
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "الي : ${DateFormat.yMd("ar").format(widget.apartmentModel.reservation!.to!)}",
                                            textDirection: ui.TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize:16.sp,
                                                color: const Color(0xff212A3E)
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height:30.h,),
                        widget.isMorafk?!(widget.apartmentModel.isReserved??false)?Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                              elevation: 5.0,
                              color: Colors.grey,
                              padding: REdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 80,
                              ),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide: BorderSide.none,
                              ),
                              onPressed: () {
                                if(PrefsHelper.getCode().isEmpty){
                                  showToast("هذا الكود تم الحجز به");
                                }else{
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) {
                                    return hagz(widget.apartmentModel);
                                  }));
                                }
                              },
                              child:Text(
                                "حجز",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold),
                              )),
                        ):const SizedBox():const SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          listener: (context , state){},
        )
    );
  }
}
