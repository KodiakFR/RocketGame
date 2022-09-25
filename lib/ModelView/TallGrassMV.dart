import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/TallGrassModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';

class TallGrassMV {
 final PlayerModel playerModel;
 final List<TrapModel> trapsPlayer;
 final List<TallGrassModel> tallGrassPlayer;
  TallGrassMV({
    required this.playerModel,
    required this.trapsPlayer,
    required this.tallGrassPlayer,
  });

 

  TallGrassMV copyWith({
    PlayerModel? playerModel,
    List<TrapModel>? trapsPlayer,
    List<TallGrassModel>? tallGrassPlayer,
  }) {
    return TallGrassMV(
      playerModel: playerModel ?? this.playerModel,
      trapsPlayer: trapsPlayer ?? this.trapsPlayer,
      tallGrassPlayer: tallGrassPlayer ?? this.tallGrassPlayer,
    );
  }

}
