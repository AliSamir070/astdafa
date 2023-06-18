part of 'msahma_sign_in_cubit.dart';

abstract class MsahmaSignInState {}

class MsahmaSignInInitial extends MsahmaSignInState {}
class MsahmaSignInLoadingState extends MsahmaSignInState{}
class MsahmaSignInSuccessState extends MsahmaSignInState{
  String message;
  User user;
  MsahmaSignInSuccessState(this.message,this.user);
}
class MsahmaSignInErrorState extends MsahmaSignInState{
  String error;
  MsahmaSignInErrorState(this.error);
}
