import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/ApartmentModel.dart';
import '../../shared/apartemet_dialog.dart';
import '../../shared/constants.dart';
import '../../shared/custom_loading.dart';
import 'cubit/apartment_cubit.dart';

class EditApartmentAdScreen extends StatefulWidget {
  ApartmentModel apartmentModel;
  EditApartmentAdScreen(this.apartmentModel);

  @override
  State<EditApartmentAdScreen> createState() => _EditApartmentAdScreenState();
}

class _EditApartmentAdScreenState extends State<EditApartmentAdScreen> {
  TextEditingController? addressController;
  TextEditingController? descController;
  TextEditingController? placeController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    addressController?.dispose();
    descController?.dispose();
    placeController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ApartmentModel apartmentModel = widget.apartmentModel;
    if(addressController == null){
      addressController = TextEditingController(text: apartmentModel.address);
      descController = TextEditingController(text: apartmentModel.describtion);
      placeController = TextEditingController(text: apartmentModel.location);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("تعديل الاعلان"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: REdgeInsets.symmetric(
            horizontal: 28,
          ),
          width: MediaQuery.of(context).size.width,
          child: BlocConsumer<EditApartmentCubit , EditApartmentStates>(
              builder: (context , state){
                EditApartmentCubit editApartmentCubit = EditApartmentCubit.get(context);
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
                            if(state is! EditApartmentLoadingState){
                              if(formKey.currentState!.validate()){
                                apartmentModel.location = placeController?.text;
                                apartmentModel.describtion = descController?.text;
                                apartmentModel.address = addressController?.text;
                                editApartmentCubit.EditAdApartment(apartmentModel);
                              }
                            }
                          },
                          child:
                          state is EditApartmentLoadingState?CustomLoading()
                              :Text(
                            "تعديل",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20.h,
                      ),

                    ],
                  ),
                );
              },
              listener: (context , state){
                if(state is EditApartmentSuccessfulState){
                  showToast(state.message);
                  Navigator.pop(context);
                }else if(state is EditApartmentErrorState){
                  showToast(state.error);
                }
              }
          ),
        ),
      ),
    );
  }
}
