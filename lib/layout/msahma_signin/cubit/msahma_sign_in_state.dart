part of 'msahma_sign_in_cubit.dart';

abstract class MsahmaSignInState {}

class MsahmaSignInInitial extends MsahmaSignInState {}
class MsahmaSignInLoadingState extends MsahmaSignInState{}
class MsahmaSignInSuccessState extends MsahmaSignInState{
  String message;
  MsahmaSignInSuccessState(this.message);
}
class MsahmaSignInErrorState extends MsahmaSignInState{
  String error;
  MsahmaSignInErrorState(this.error);
}
