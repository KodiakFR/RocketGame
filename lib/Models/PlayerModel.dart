import 'package:team_rocket_game/Models/TrapModel.dart';

class PlayerModel {
  final String? uid;
  final String? pseudo;
  final bool? genre;
  int? money;
  int? level;
  int? xpNextLevel;
  int? xpActually;
  String city;
  DateTime? move;
  

  PlayerModel(
    this.uid,
    this.pseudo,
    this.genre,
    this.money,
    this.level,
    this.xpNextLevel,
    this.xpActually,
    this.city,
    this.move,

  );

   int? get getMoney => this.money;
 set setMoney(int? money) => this.money = money;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'pseudo': pseudo,
        'genre': genre,
        'money': money,
        'level': level,
        'xpNextLevel': xpNextLevel,
        'xpActually': xpActually,
        'city': city,
        'move': move,
      };
}
