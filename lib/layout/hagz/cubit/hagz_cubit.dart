import 'package:astdafa/database_helper/my_database.dart';
import 'package:astdafa/error_handler/firebase_error_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'hagz_state.dart';

class HagzCubit extends Cubit<HagzState> {
  HagzCubit() : super(HagzInitialState());
  static HagzCubit get(context) => BlocProvider.of(context);


  DateTime checkIn = DateTime.now();
  DateTime checkOut = DateTime.now().add(const Duration(days: 1));
  void changeCheckInDate({DateTime? newCheckIn}){
    if(newCheckIn!=null){
      checkIn = newCheckIn;
      checkOut = newCheckIn.add(const Duration(days: 1));
      emit(HagzApartmentChangeCheckIn());
    }
  }
  void changeCheckOutDate({DateTime? newCheckOut}){
    if(newCheckOut != null){
      checkOut = newCheckOut;
      emit(HagzApartmentChangeCheckOut());
    }
  }
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
