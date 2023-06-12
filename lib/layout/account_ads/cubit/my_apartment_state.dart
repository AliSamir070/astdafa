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

class MyApartmentsGetApartmentsLoadingState extends MyApartmentState{}
class MyApartmentsGetApartmentsSuccessState extends MyApartmentState{}
class MyApartmentsGetApartmentsErrorState extends MyApartmentState{
  String error;
  MyApartmentsGetApartmentsErrorState(this.error);
}
class MyApartmentsDeleteSuccessState extends MyApartmentState{
  String message;
  MyApartmentsDeleteSuccessState(this.message);
}
class MyApartmentsDeleteErrorState extends MyApartmentState{
  String error;
  MyApartmentsDeleteErrorState(this.error);
}
class MyApartmentDeleteLoadingState extends MyApartmentState{}