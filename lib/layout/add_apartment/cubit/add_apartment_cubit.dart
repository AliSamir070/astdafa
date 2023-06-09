
import 'dart:io';

import 'package:astdafa/database_helper/my_database.dart';
import 'package:astdafa/error_handler/firebase_error_handler.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:astdafa/storage_handler/storage_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../authentication_handler/authentication_handler.dart';
import '../../../model/Reservation.dart';
import '../../../shared/permission_handler.dart';

part 'add_apartment_state.dart';

class AddApartmentCubit extends Cubit<AddApartmentState> {
  AddApartmentCubit() : super(AddApartmentInitialState());
  static AddApartmentCubit get(context)=>BlocProvider.of(context);

  List<XFile> apartmentImages = [];
  List<String> apartmentImagesLinks = [];
  Future getImage(ImageSource imageSource) async {
    try{
      if(imageSource == ImageSource.gallery){
        bool permissionStorageGranted = await  PermissionHandling.requestStoragePermission();
        if(permissionStorageGranted) {
          final List<XFile> images = await ImagePicker().pickMultiImage();
          if (images == null) return;
          apartmentImages.addAll(images);
        }
      }else{
        bool permissionCameraGranted = await PermissionHandling.requestCameraPermission();
        if(permissionCameraGranted) {
          final image = await ImagePicker().pickImage(source: imageSource);
          if (image == null) return;
          apartmentImages.add(image);
        }
      }
      emit(AddApartmentUploadImages());
    }on PlatformException catch (_) {

    }

  }

  void createApartmentAd(String address , String description , String location){
    try{
      emit(AddApartmentLoadingState());
      if(apartmentImages.isNotEmpty){
        uploadImages().then((value) {
          ApartmentModel apartmentModel = ApartmentModel(
              address: address,
              describtion: description,
              location: location,
              isReserved: false,
              photos: apartmentImagesLinks,
              userId: FirebaseAuth.instance.currentUser?.uid,
              name: AuthHandler.firebaseAuth.currentUser?.displayName,
              reservation: Reservation(
                name: "",
                code: "",
                phone: "",
              )
          );
          MyDataBase.addApartment(apartmentModel).then((value){
            emit(AddApartmentSuccessState("تم اضافة الاعلان بنجاح"));
          }).catchError((e){
            e is Exception
            ?emit(AddApartmentErrorState(FirebaseErrorHandler.handleError(e)))
            :emit(AddApartmentErrorState(e.toString()));
          });
        }).catchError((e){
          e is Exception
          ?emit(AddApartmentErrorState(FirebaseErrorHandler.handleError(e)))
          :emit(AddApartmentErrorState(e.toString()));
        });
      }else{
        ApartmentModel apartmentModel = ApartmentModel(
            address: address,
            describtion: description,
            location: location,
            isReserved: false,
            photos: [],
            userId: FirebaseAuth.instance.currentUser?.uid,
            name: FirebaseAuth.instance.currentUser?.displayName,
            reservation: Reservation(
              name: "",
              code: "",
              phone: "",
            )
        );
        MyDataBase.addApartment(apartmentModel).then((value){
          emit(AddApartmentSuccessState("تم اضافة الاعلان بنجاح"));
        }).catchError((e){
          e is Exception
          ?emit(AddApartmentErrorState(FirebaseErrorHandler.handleError(e)))
          :emit(AddApartmentErrorState(e.toString()));
        });
      }
    }on Exception catch(e){
      emit(AddApartmentErrorState(FirebaseErrorHandler.handleError(e)));
    }

  }
  Future uploadImages(){
    return StorageHandler.uploadApartmentImages(apartmentImages, apartmentImagesLinks);
  }
}
