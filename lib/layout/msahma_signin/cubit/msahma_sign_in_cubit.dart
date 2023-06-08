import 'package:astdafa/authentication_handler/authentication_handler.dart';
import 'package:astdafa/error_handler/firebase_error_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'msahma_sign_in_state.dart';

class MsahmaSignInCubit extends Cubit<MsahmaSignInState> {
  MsahmaSignInCubit() : super(MsahmaSignInInitial());
  static MsahmaSignInCubit get(context)=>BlocProvider.of(context);

  void signIn(GlobalKey<FormState> formKey , String email , String password){
    if(formKey.currentState!.validate()){
      try{
        emit(MsahmaSignInLoadingState());
        AuthHandler.login(email, password).then((value){
          emit(MsahmaSignInSuccessState("تم الدخول بنجاح"));
        }).catchError((e){
          e is Exception
          ?emit(MsahmaSignInErrorState(FirebaseErrorHandler.handleError(e)))
          :emit(MsahmaSignInErrorState(e.toString()));
        });
      }on Exception catch(e){
        emit(MsahmaSignInErrorState(FirebaseErrorHandler.handleError(e)));
      }
    }
  }
}
