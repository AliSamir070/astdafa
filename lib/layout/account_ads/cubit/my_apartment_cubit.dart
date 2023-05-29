import 'package:astdafa/authentication_handler/authentication_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../error_handler/firebase_error_handler.dart';

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
        emit(MyApartmentSignOutErrorState(FirebaseErrorHandler.handleError(e)));
      });
    }on Exception catch(e){
      emit(MyApartmentSignOutErrorState(FirebaseErrorHandler.handleError(e)));
    }
  }
}
