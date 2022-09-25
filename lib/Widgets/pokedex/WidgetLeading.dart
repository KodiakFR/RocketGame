import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PokedexModel.dart';
import 'package:team_rocket_game/Services/pokemonServices.dart';

class WidgetLeading extends StatelessWidget {
  final PokedexModel pokedexModel;
  const WidgetLeading({
    required this.pokedexModel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(pokedexModel.qantity==null)
    {
     return Text(pokedexModel.id.toString().padLeft(3,'0'));
    }
    else{
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
         
          Container(
            height: 20,
            width: 20,
            child: Image.asset('lib/IMG/Icons/IconPokeballrocket.png'),
          ),
          SizedBox(width: 5),
          Text(pokedexModel.id.toString().padLeft(3,'0'))
        ],
      );
    }

  }
}