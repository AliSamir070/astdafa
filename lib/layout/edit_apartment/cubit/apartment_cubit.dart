import 'package:astdafa/database_helper/my_database.dart';
import 'package:astdafa/error_handler/firebase_error_handler.dart';
import 'package:astdafa/model/ApartmentModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../shared/permission_handler.dart';

part 'apartment_state.dart';

class EditApartmentCubit extends Cubit<EditApartmentStates> {
  EditApartmentCubit() : super(EditApartmentInitialState());
  static EditApartmentCubit get(context)=>BlocProvider.of(context);

  void EditAdApartment(ApartmentModel apartmentModel){
    try{
      emit(EditApartmentLoadingState());
      MyDataBase.updateApartment(apartmentModel).then((value) {
        emit(EditApartmentSuccessfulState("تم تعديل الاعلان بنجاح"));
      }).catchError((e){
        emit(EditApartmentErrorState(FirebaseErrorHandler.handleError(e)));
      });
    }on Exception catch(e){
      emit(EditApartmentErrorState(FirebaseErrorHandler.handleError(e)));
    }
  }
}
