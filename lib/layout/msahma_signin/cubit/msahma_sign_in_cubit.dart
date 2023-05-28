import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'msahma_sign_in_state.dart';

class MsahmaSignInCubit extends Cubit<MsahmaSignInState> {
  MsahmaSignInCubit() : super(MsahmaSignInInitial());
  static MsahmaSignInCubit get(context)=>BlocProvider.of(context);


}
