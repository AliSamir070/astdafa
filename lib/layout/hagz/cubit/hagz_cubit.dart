import 'package:astdafa/database_helper/my_database.dart';
import 'package:astdafa/error_handler/firebase_error_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'hagz_state.dart';

class HagzCubit extends Cubit<HagzState> {
  HagzCubit() : super(HagzInitialState());
  static HagzCubit get(context) => BlocProvider.of(context);

  void addHagz(String name , String phone , String apartmentId){
    try{
      emit(HagzApartmentLoadingState());
      MyDataBase.updateApartmentReserved(apartmentId, name, phone).then((value){
        MyDataBase.updateCodeReserved().then((value) {
          emit(HagzApartmentSuccessState("تم الحجز بنجاح"));
        }).catchError((e){
          e is Exception
          ?emit(HagzApartmentErrorState(FirebaseErrorHandler.handleError(e)))
          :emit(HagzApartmentErrorState(e.toString()));
        });
      }).catchError((e){
        e is Exception
        ?emit(HagzApartmentErrorState(FirebaseErrorHandler.handleError(e)))
        :emit(HagzApartmentErrorState(e.toString()));
      });
    }on Exception catch(e){
      emit(HagzApartmentErrorState(FirebaseErrorHandler.handleError(e)));
    }
  }
}
