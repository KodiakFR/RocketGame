import 'package:bloc/bloc.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';

class PlayerBloc extends Cubit<PlayerModel>{
  PlayerBloc(super.initialState);

  void onChangedGenre(){
    final genre = !state.genre!;
    print('bloc $genre');
    emit(state.copyWith(genre: genre));  
  }

  void onChangedPseudo(String value){
    final pseudo = value;
    emit(state.copyWith(pseudo: pseudo));

  }
   
 String valueGenre(){
    String genre = 'Garçon';
    if(state.genre == true){
      genre = 'Garçon';
      return  genre;
    
    }else{
      genre = 'Fille';
      return genre;
    }
  }

  void onChangedMonney(int value){
    state.money = value;
  }

  void onChangedLevel(int value){
    state.level = value;
  }

  void onChangedXpActually(int value){
    state.xpActually = value;
  }
    void onChangedXpNextLevel(int value){
    state.xpNextLevel = value;
  }
    void onChangedCity(String value){
    state.city = value;
  }
  void onChangedMove(DateTime value){
    state.move = value;
  }
}