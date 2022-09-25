import 'package:bloc/bloc.dart';

class TextFieldConfirmPasswordBloc extends Cubit<String>{
  TextFieldConfirmPasswordBloc(super.initialState);

  void onChangedConfirmPassword(String value){
    emit(value);
  }

}