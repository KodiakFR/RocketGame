import 'package:team_rocket_game/Models/PokemonModel.dart';

class PokedexModel {
  //Attribute
  int id;
  String name;
  final String? scarcity;
  final String? type;
  final int? level;
  final int? levelEvo;
  final int? idEvo;
  final String? steelEvo;
  final int? price;
  final String? url;
  final List<dynamic>? cities;
  final int? qantity;

  //Constructor
  PokedexModel(this.id, this.name, this.scarcity, this.type, this.level,
      this.levelEvo, this.idEvo, this.steelEvo, this.price,this.url, this.cities, this.qantity);

  PokedexModel.NoDiscovered(this.id, this.name,[this.scarcity, this.type, this.level, this.levelEvo, this.idEvo, this.steelEvo, this.price, this.url, this.cities, this.qantity]);
    

  //setter - getter


   Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'scarcity': scarcity,
        'type': type,
        'level': level,
        'levelEvo': levelEvo,
        'idEvo': idEvo,
        'steelEvo': steelEvo,
        'price': price,
        'url' : url,
        'cities': cities,
        'qantity':qantity
      };

  factory PokedexModel.fromJson(Map<String, dynamic> json) {
    return PokedexModel(
      json['id'],
      json['name'],
      json['scarcity'],
      json['type'],
      json['level'],
      json['levelEvo'],
      json['idEvo'],
      json['steelEvo'],
      json['price'],
      json['url'],
      json['cities'],
      json['qantity']
    );
  }
}
