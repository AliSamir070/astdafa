part of 'add_apartment_cubit.dart';

abstract class AddApartmentState {}

class AddApartmentInitialState extends AddApartmentState {}
class AddApartmentLoadingState extends AddApartmentState {}
class AddApartmentSuccessState extends AddApartmentState {
  String message;
  AddApartmentSuccessState(this.message);
}
class AddApartmentErrorState extends AddApartmentState{
  String error;
  AddApartmentErrorState(this.error);
}
class AddApartmentUploadImages extends AddApartmentState{}

