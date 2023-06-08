import 'package:astdafa/authentication_handler/authentication_handler.dart';
import 'package:astdafa/database_helper/my_database.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../error_handler/firebase_error_handler.dart';
import '../../../model/ApartmentModel.dart';

part 'my_apartment_state.dart';

class MyApartmentCubit extends Cubit<MyApartmentState> {
  MyApartmentCubit() : super(MyApartmentInitialState());
  static MyApartmentCubit get(context)=>BlocProvider.of(context);

  void SignOut(){
    try{
      emit(MyApartmentSignOutLoadingState());
      AuthHandler.signout().then((value){
        emit(MyApartmentSignOutSuccessState("تم تسجيل الخروج بنجاح"));
      }).catchError((e){
        e is Exception
        ?emit(MyApartmentSignOutErrorState(FirebaseErrorHandler.handleError(e)))
        :emit(MyApartmentSignOutErrorState(e.toString()));
      });
    }on Exception catch(e){
      emit(MyApartmentSignOutErrorState(FirebaseErrorHandler.handleError(e)));
    }
  }
  List<ApartmentModel> apartments = [];
  void getMyApartmentsAds(){
    try{
      emit(MyApartmentsGetApartmentsLoadingState());
      MyDataBase.readApartmentsOfUser(AuthHandler.getUser()??"").then((value) {
        apartments = value.map((e) =>e.data()).toList();
        emit(MyApartmentsGetApartmentsSuccessState());
      }).catchError((e){
        e is Exception
        ?emit(MyApartmentsGetApartmentsErrorState(FirebaseErrorHandler.handleError(e)))
        :emit(MyApartmentsGetApartmentsErrorState(e.toString()));
      });
    }on Exception catch(e){
      emit(MyApartmentsGetApartmentsErrorState(FirebaseErrorHandler.handleError(e)));
    }
  }
}
