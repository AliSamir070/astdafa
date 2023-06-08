part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitialState extends ForgotPasswordState {}
class ForgotPasswordLoadingState extends ForgotPasswordState{}
class ForgotPasswordSuccessState extends ForgotPasswordState{
  String message;
  ForgotPasswordSuccessState(this.message);
}
class ForgotPasswordErrorState extends ForgotPasswordState{
  String error;
  ForgotPasswordErrorState(this.error);
}
class ForgotPasswordFinishTimerState extends ForgotPasswordState{}
