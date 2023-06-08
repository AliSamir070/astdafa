part of 'shakwa_cubit.dart';

abstract class ShakwaState {}

class ShakwaInitialState extends ShakwaState {}
class ShakwaAddLoadingState extends ShakwaState {}
class ShakwaAddSuccessState extends ShakwaState {
  String message;
  ShakwaAddSuccessState(this.message);
}
class ShakwaAddErrorState extends ShakwaState{
  String error;
  ShakwaAddErrorState(this.error);
}
