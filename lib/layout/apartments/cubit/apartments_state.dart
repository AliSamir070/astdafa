part of 'apartments_cubit.dart';

abstract class ApartmentsState {}

class ApartmentsInitialState extends ApartmentsState {}
class ApartmentGetAllApartmentsSuccessState extends ApartmentsState{}
class ApartmentGetAllApartmentsLoadingState extends ApartmentsState{}
class ApartmentGetAllApartmentsErrorState extends ApartmentsState{
  String error;
  ApartmentGetAllApartmentsErrorState(this.error);
}
