import 'package:astdafa/database_helper/my_database.dart';
import 'package:astdafa/error_handler/firebase_error_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'morafk_login_state.dart';

class MorafkLoginCubit extends Cubit<MorafkLoginState> {
  MorafkLoginCubit() : super(MorafkLoginInitialState());
  static MorafkLoginCubit get(context)=>BlocProvider.of(context);

  void login(GlobalKey<FormState> formKey , String code , String phone){
    if(formKey.currentState!.validate()){
      try{
        emit(MorafkLoginLoadingState());
        MyDataBase.readCode(code).then((value) {
          if(value == null){
            emit(MorafkLoginErrorState("هذا الكود غير صحيح"));
          }else{
            if((value.entries??0)==0){
              emit(MorafkLoginErrorState("هذا الكود منتهي"));
            }else if(value.isReserved??false){
              emit(MorafkLoginErrorState("هذا الكود تم استخدامه"));
            }else{
              MyDataBase.updateCode(value.id??"", {
                "entries":(value.entries??0)-1
              }).then((value){
                emit(MorafkLoginSuccessState("تم الدخول بنجاح"));
              }).catchError((e){
                emit(MorafkLoginErrorState(FirebaseErrorHandler.handleError(e)));
              });
            }
          }
        }).catchError((e){
          emit(MorafkLoginErrorState(FirebaseErrorHandler.handleError(e)));
        });
      }on Exception catch(e){
        emit(MorafkLoginErrorState(FirebaseErrorHandler.handleError(e)));
      }
    }
  }
}
