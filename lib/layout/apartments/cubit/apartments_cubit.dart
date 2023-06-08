import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../database_helper/my_database.dart';
import '../../../error_handler/firebase_error_handler.dart';
import '../../../model/ApartmentModel.dart';

part 'apartments_state.dart';

class ApartmentsCubit extends Cubit<ApartmentsState> {
  ApartmentsCubit() : super(ApartmentsInitialState());
  static ApartmentsCubit get(context)=>BlocProvider.of(context);
  List<ApartmentModel> apartments = [];

  void getMyApartmentsAds(){
    try{
      emit(ApartmentGetAllApartmentsLoadingState());
      MyDataBase.readAllApartments().then((value) {
        apartments = value.map((e) =>e.data()).toList();
        emit(ApartmentGetAllApartmentsSuccessState());
      }).catchError((e){
        print(e.toString());
        e is Exception?
        emit(ApartmentGetAllApartmentsErrorState(FirebaseErrorHandler.handleError(e)))
            :emit(ApartmentGetAllApartmentsErrorState(e.toString()));
      });
    }on Exception catch(e){
      emit(ApartmentGetAllApartmentsErrorState(FirebaseErrorHandler.handleError(e)));
    }
  }
}
