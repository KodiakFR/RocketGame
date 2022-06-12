import 'package:team_rocket_game/Models/PokemonModel.dart';

class PokedexModel {
  //Attribute
  late final int pokemonId;
  late final String pokemonName;
  late final int qantity;

  //Constructor
  PokedexModel(this.pokemonId, this.pokemonName, this.qantity);

  //setter - getter
  get getPokemonId => this.pokemonId;

  set setPokemonId(pokemonId) => this.pokemonId = pokemonId;

  get getPokemonName => this.pokemonName;

  set setPokemonName(pokemonName) => this.pokemonName = pokemonName;

  get getQantity => this.qantity;

  set setQuantity(qantity) => this.qantity = qantity;

  Map<String, dynamic> toJson() => {
        'pokemonId': pokemonId,
        'pokemonName': pokemonName,
        'qantity': qantity,
      };

  factory PokedexModel.fromJson(Map<String, dynamic> json) {
    return PokedexModel(
      json['pokemonId'],
      json['pokemonName'],
      json['qantity'],
    );
  }
}
