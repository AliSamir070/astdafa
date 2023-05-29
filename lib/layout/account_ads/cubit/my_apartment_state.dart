part of 'my_apartment_cubit.dart';

abstract class MyApartmentState {}

class MyApartmentInitialState extends MyApartmentState {}
class MyApartmentSignOutLoadingState extends MyApartmentState {}
class MyApartmentSignOutSuccessState extends MyApartmentState {
  String message;
  MyApartmentSignOutSuccessState(this.message);
}
class MyApartmentSignOutErrorState extends MyApartmentState {
  String error;
  MyApartmentSignOutErrorState(this.error);
}
