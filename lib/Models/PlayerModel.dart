import 'package:team_rocket_game/Models/TrapModel.dart';

class PlayerModel {
  String? uid;
  String? pseudo;
  bool? genre = true;
  int? money;
  int? level;
  int? xpNextLevel;
  int? xpActually;
  String? city;
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
  PlayerModel.empty();

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

  PlayerModel copyWith({
      String? uid,
      String? pseudo,
      bool? genre,
      int? money,
      int? level,
      int? xpNextLevel,
      int? xpActually,
      String? city,
      DateTime? move}) {
    return PlayerModel(
      uid ?? this.uid,
      pseudo ?? this.pseudo,
      genre ?? this.genre,
      money ?? this.money,
      level ?? this.level,
      xpNextLevel ?? this.xpNextLevel,
      xpActually ?? this.xpActually,
      city ?? this.city,
      move ?? this.move,
    );
  }
}
