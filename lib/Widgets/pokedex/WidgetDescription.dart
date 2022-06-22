import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PokedexModel.dart';

class WidegetDescription extends StatelessWidget {
  PokedexModel pokedexModel;
  WidegetDescription({required this.pokedexModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80,
          width: 80,
          child: Image.network(pokedexModel.url!),
        ),
        SizedBox(height: 10,),
        Text('Rareté : ${pokedexModel.scarcity}'),
        SizedBox(height: 10,),
        Text('Type : ${pokedexModel.type}'),
        SizedBox(height: 10,),
        Text('Nombre capturé : ${pokedexModel.qantity}'),
        SizedBox(height: 10,),
        Text('Vue à : ${pokedexModel.cities.toString().replaceAll('[', '').replaceAll(']', '')}',textAlign: TextAlign.center,),

      ],
    );
}
}