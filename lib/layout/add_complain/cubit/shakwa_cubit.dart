import 'package:astdafa/database_helper/my_database.dart';
import 'package:astdafa/error_handler/firebase_error_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/Complain.dart';

part 'shakwa_state.dart';

class ShakwaCubit extends Cubit<ShakwaState> {
  ShakwaCubit() : super(ShakwaInitialState());
  static ShakwaCubit get(context)=>BlocProvider.of(context);

  void AddShakwa(String name , String email , String desc){
    emit(ShakwaAddLoadingState());
    try{
      MyDataBase.addComplain(Complain(
        name: name,
        email: email,
        desc: desc
      )).then((value) {
        emit(ShakwaAddSuccessState("تم ارسال شكوتك سيتم المتابعة في اقرب وقت"));
      }).catchError((e){
        e is Exception
        ?emit(ShakwaAddErrorState(FirebaseErrorHandler.handleError(e)))
        :emit(ShakwaAddErrorState(e.toString()));
      });
    }on Exception catch(e){
      emit(ShakwaAddErrorState(FirebaseErrorHandler.handleError(e)));
    }
  }
}
