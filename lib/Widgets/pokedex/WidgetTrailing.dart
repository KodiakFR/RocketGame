import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PokedexModel.dart';

class WidgetTrailing extends StatelessWidget {
  final PokedexModel pokedexModel;
  const WidgetTrailing({required this.pokedexModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pokedexModel.qantity != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 35,
            width: 35,
            child: Image.network('${pokedexModel.url}'),
          ),
          Text('x ${pokedexModel.qantity}')
        ],
      );
    } else {
      return Container(width: 10, height: 10,);
    }
  }
}
