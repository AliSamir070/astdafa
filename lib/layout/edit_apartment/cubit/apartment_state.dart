part of 'apartment_cubit.dart';

abstract class EditApartmentStates {}

class EditApartmentInitialState extends EditApartmentStates {}
class EditApartmentLoadingState extends EditApartmentStates {}
class EditApartmentUploadImages extends EditApartmentStates {}
class EditApartmentSuccessfulState extends EditApartmentStates {
  String message;
  EditApartmentSuccessfulState(this.message);
}
class EditApartmentErrorState extends EditApartmentStates {
  String error;
  EditApartmentErrorState(this.error);
}
