part of 'morafk_login_cubit.dart';

abstract class MorafkLoginState {}

class MorafkLoginInitialState extends MorafkLoginState {}
class MorafkLoginLoadingState extends MorafkLoginState {}
class MorafkLoginSuccessState extends MorafkLoginState {
  String message;
  MorafkLoginSuccessState(this.message);
}
class MorafkLoginErrorState extends MorafkLoginState{
  String error;
  MorafkLoginErrorState(this.error);
}
