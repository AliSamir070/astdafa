import 'dart:io';

import 'package:astdafa/layout/account_ads/cubit/my_apartment_cubit.dart';
import 'package:astdafa/layout/account_ads/myapartment.dart';
import 'package:astdafa/layout/add_apartment/cubit/add_apartment_cubit.dart';
import 'package:astdafa/layout/add_complain/shkwa.dart';
import 'package:astdafa/shared/apartemet_dialog.dart';
import 'package:astdafa/shared/constants.dart';
import 'package:astdafa/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class addapartment extends StatefulWidget {
  const addapartment({Key? key}) : super(key: key);

  @override
  State<addapartment> createState() => _addapartmentState();
}

class _addapartmentState extends State<addapartment> {
  late TextEditingController addressController;
  late TextEditingController descController;
  late TextEditingController placeController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>AddApartmentCubit(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("إضافة الشقق"),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: REdgeInsets.symmetric(
                horizontal: 28,
              ),
              width: MediaQuery.of(context).size.width,
              child: BlocConsumer<AddApartmentCubit , AddApartmentState>(
                  builder: (context , state){
                    AddApartmentCubit addApartmentCubit = AddApartmentCubit.get(context);
                    return Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25.h,
                          ),
                          Image.asset(
                            "assets/images/astdafa.png",
                            width: 200.w,
                            height: 200.h,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          addApartmentCubit.apartmentImages.isNotEmpty
                              ?Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  showApartmentDialog(
                                      context: context,
                                      takeImageGallery: (){
                                        Navigator.pop(context);
                                        addApartmentCubit.getImage(ImageSource.gallery);
                                      },
                                      takeImageCamera: (){
                                        Navigator.pop(context);
                                        addApartmentCubit.getImage(ImageSource.camera);
                                      }
                                  );
                                },
                                child: Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(color: Colors.black , width: 2.w)
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 35.r,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w,),
                              Flexible(
                                child: SizedBox(
                                  height: 100.h,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context , index)=>Container(
                                        height:100.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.r),
                                            image: DecorationImage(
                                                image: FileImage(File(addApartmentCubit.apartmentImages[index].path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                      separatorBuilder: (context , index)=>SizedBox(width: 10.w,),
                                      itemCount: addApartmentCubit.apartmentImages.length
                                  ),
                                ),
                              ),

                            ],
                          )
                              :InkWell(
                            onTap: (){
                              showApartmentDialog(
                                  context: context,
                                  takeImageGallery: (){
                                    Navigator.pop(context);
                                    addApartmentCubit.getImage(ImageSource.gallery);
                                  },
                                  takeImageCamera: (){
                                    Navigator.pop(context);
                                    addApartmentCubit.getImage(ImageSource.camera);
                                  }
                              );
                            },
                            child: Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                shape: BoxShape.rectangle,
                                border: Border.all(color: Colors.black , width: 2.w)
                              ),
                              child: Icon(
                                Icons.add,
                                size: 35.r,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: addressController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "يجب ادخاله";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                              hintText: "أدخل العنوان",
                              prefixIcon: Icon(Icons.subject),
                              enabledBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide:  BorderSide(
                                    color: Colors.grey,
                                    width: 1.w,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide:  BorderSide(
                                    color: Colors.grey,
                                    width: 1.w,
                                  )),
                              disabledBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ))),
                              focusedBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ))),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: descController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "يجب ادخاله";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: "أدخل تفاصيل",
                              prefixIcon: Icon(Icons.subject),
                              enabledBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ))),
                              disabledBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide:  BorderSide(
                                    color: Colors.grey,
                                    width: 1.w,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide:  BorderSide(
                                    color: Colors.grey,
                                    width: 1.w,
                                  )),
                              focusedBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ))),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            controller: placeController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "يجب ادخاله";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                              hintText: "المنطقة",
                              prefixIcon: Icon(Icons.location_city),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide:  BorderSide(
                                    color: Colors.grey,
                                    width: 1.w,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide:  BorderSide(
                                    color: Colors.grey,
                                    width: 1.w,
                                  )),
                              enabledBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ))),
                              disabledBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ))),
                              focusedBorder: (OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0.w,
                                  ))),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          MaterialButton(
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
                                if(state is! AddApartmentLoadingState){
                                  if(formKey.currentState!.validate()){
                                    addApartmentCubit.createApartmentAd(
                                        addressController.text.trim(),
                                        descController.text.trim(),
                                        placeController.text.trim()
                                    );
                                  }
                                }
                              },
                              child:
                              state is AddApartmentLoadingState?CustomLoading()
                              :Text(
                                "إنتهاء",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          MaterialButton(
                              elevation: 5.0,
                              color: Colors.red,
                              padding: REdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 80,
                              ),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide: BorderSide.none,
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const shkwa();
                                }));
                              },
                              child: Text(
                                "أضف شكوى",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    );
                  },
                  listener: (context , state){
                    if(state is AddApartmentSuccessState){
                      showToast(state.message);
                      context.read<MyApartmentCubit>().getMyApartmentsAds();
                      Navigator.pop(context);
                    }else if(state is AddApartmentErrorState){
                      showToast(state.error);
                    }
                  }
              ),
            ),
          ),
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
    descController = TextEditingController();
    placeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    descController.dispose();
    placeController.dispose();
  }
}
