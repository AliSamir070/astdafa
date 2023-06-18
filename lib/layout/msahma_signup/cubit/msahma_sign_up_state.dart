part of 'msahma_sign_up_cubit.dart';

abstract class MsahmaSignUpState {}

class MsahmaSignUpInitial extends MsahmaSignUpState {}
class MsahmaSignUpLoadingState extends MsahmaSignUpState{}
class MsahmaSignUpSuccessState extends MsahmaSignUpState{
  String message;
  User user;
  MsahmaSignUpSuccessState(this.message , this.user);
}
class MsahmaSignUpErrorState extends MsahmaSignUpState{
  String error;
  MsahmaSignUpErrorState(this.error);
}
