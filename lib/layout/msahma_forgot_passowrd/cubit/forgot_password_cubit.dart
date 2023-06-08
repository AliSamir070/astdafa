import 'package:astdafa/authentication_handler/authentication_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../error_handler/firebase_error_handler.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitialState());
  static ForgotPasswordCubit get(context)=>BlocProvider.of(context);

  void forgotPasswordEmail(String email){
    try{
      AuthHandler.restPassEmail(email).then((value) {
        emit(ForgotPasswordSuccessState("تم الارسال بنجاح, تحقق من بريدك الوارد"));
      }).catchError((e){
        e is Exception
        ?emit(ForgotPasswordErrorState(FirebaseErrorHandler.handleError(e)))
        :emit(ForgotPasswordErrorState(e.toString()));
      });
    }on Exception catch(e){
      emit(ForgotPasswordErrorState(FirebaseErrorHandler.handleError(e)));
    }
  }
  void FinishTimer(){
    emit(ForgotPasswordFinishTimerState());
  }
}
