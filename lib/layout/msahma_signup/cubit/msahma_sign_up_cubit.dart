import 'package:astdafa/authentication_handler/authentication_handler.dart';
import 'package:astdafa/database_helper/my_database.dart';
import 'package:astdafa/error_handler/firebase_error_handler.dart';
import 'package:astdafa/model/user.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'msahma_sign_up_state.dart';

class MsahmaSignUpCubit extends Cubit<MsahmaSignUpState> {
  MsahmaSignUpCubit() : super(MsahmaSignUpInitial());
  static MsahmaSignUpCubit get(context)=>BlocProvider.of(context);

  void signUp(GlobalKey<FormState> formKey , String name , String email , String phone , String password){
    if(formKey.currentState!.validate()){
      emit(MsahmaSignUpLoadingState());
      try{
        AuthHandler.register(email, password).then((value){
          User user = User(
            name: name,
            email: email,
            password: password,
            phone: phone,
            id: AuthHandler.getUser()
          );
          MyDataBase.addUser(user, AuthHandler.getUser()??"").then((value){
            emit(MsahmaSignUpSuccessState("تم التسجيل بنجاح"));
          }).catchError((error){
            emit(MsahmaSignUpErrorState(FirebaseErrorHandler.handleError(error)));
          });
        }).catchError((error){
          emit(MsahmaSignUpErrorState(FirebaseErrorHandler.handleError(error)));
        });
      }on Exception catch(e){
        emit(MsahmaSignUpErrorState(FirebaseErrorHandler.handleError(e)));
      }
    }
  }

}
