import 'package:bloc/bloc.dart';
import 'package:team_rocket_game/Models/UserModel.dart';

class UserBloc extends Cubit<UserModel>{
  UserBloc(super.initialState);

    void onChangedEmail(String value){
    final email = value;
    emit(state.copyWith(email: email));
    }
      void onChangedPassword(String value){
    final password = value;
    emit(state.copyWith(password: password));
  }
  
}