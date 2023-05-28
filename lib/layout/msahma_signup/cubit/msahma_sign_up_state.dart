part of 'msahma_sign_up_cubit.dart';

abstract class MsahmaSignUpState {}

class MsahmaSignUpInitial extends MsahmaSignUpState {}
class MsahmaSignUpLoadingState extends MsahmaSignUpState{}
class MsahmaSignUpSuccessState extends MsahmaSignUpState{
  String message;
  MsahmaSignUpSuccessState(this.message);
}
class MsahmaSignUpErrorState extends MsahmaSignUpState{
  String error;
  MsahmaSignUpErrorState(this.error);
}
