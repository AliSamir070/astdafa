import 'package:astdafa/layout/home/home.dart';
import 'package:astdafa/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/constants.dart';
import 'cubit/shakwa_cubit.dart';
class shkwa extends StatefulWidget {
  const shkwa({Key? key}) : super(key: key);
  @override
  State<shkwa> createState() => _shkwaState();
}
class _shkwaState extends State<shkwa> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController descController;


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    descController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ShakwaCubit(),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(centerTitle: true,
            title: const Text("الشكاوي و المقترحات"),
          ),
          backgroundColor: Colors.white,
          body: Container(
            padding: REdgeInsets.symmetric(
              horizontal: 28,
            ),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Form(
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
                    TextFormField(
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      validator: (value){
                        if(value!.isEmpty){
                          return "يجب ادخاله";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "الإسم",
                        prefixIcon: Icon(Icons.email),
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
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      validator: validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "أدخل بريدك الإلكتروني",
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.w,
                            ))),
                        disabledBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.w,
                            ))),
                        focusedBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.w,
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
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      controller: descController,
                      maxLines: null,
                      validator: (value){
                        if(value!.isEmpty){
                          return "يجب ادخاله";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "أدخل الشكوى او المقترح هنا",
                        prefixIcon: Icon(Icons.subject),
                        enabledBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.w,
                            ))),
                        disabledBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.w,
                            ))),
                        focusedBorder: (OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.w,
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
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocConsumer<ShakwaCubit , ShakwaState>(
                        builder: (context , state){
                          ShakwaCubit shakwaCubit = ShakwaCubit.get(context);
                          return MaterialButton(
                              elevation: 5.0,
                              color: Colors.grey,
                              padding: REdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 40,
                              ),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide: BorderSide.none,
                              ),
                              onPressed: () {
                                if(state is! ShakwaAddLoadingState){
                                  if(formKey.currentState!.validate()){
                                    shakwaCubit.AddShakwa(nameController.text, emailController.text, descController.text);
                                  }
                                }
                              },
                              child: state is ShakwaAddLoadingState
                              ?CustomLoading()
                                :Text(
                                "تقديم الشكوى",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold),
                              ));
                        },
                        listener: (context , state){
                          if(state is ShakwaAddSuccessState){
                            showToast(state.message);
                          }else if(state is ShakwaAddErrorState){
                            showToast(state.error);
                          }
                        }
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  String? validateEmail(String? value) {
    if(value!.isEmpty){
      return "يجب ادخاله";
    }
    String pattern = Constants.emailRegix ;
    final regex = RegExp(pattern);

    return value.isNotEmpty && !regex.hasMatch(value)
        ? "غير صحيح"
        : null;
  }
}