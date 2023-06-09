part of 'hagz_cubit.dart';

abstract class HagzState {}

class HagzInitialState extends HagzState {}
class HagzApartmentLoadingState extends HagzState {}
class HagzApartmentSuccessState extends HagzState {
  String message;
  HagzApartmentSuccessState(this.message);
}
class HagzApartmentErrorState extends HagzState {
  String error;
  HagzApartmentErrorState(this.error);
}
class HagzApartmentChangeCheckIn extends HagzState{}
class HagzApartmentChangeCheckOut extends HagzState{}

