import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/TallGrassModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Screens/tallGrass.dart';
import 'package:team_rocket_game/Services/playerServices.dart';
import 'package:team_rocket_game/Services/pokedexService.dart';
import 'package:team_rocket_game/Services/pokemonServices.dart';
import 'package:team_rocket_game/Services/trapServices.dart';
import '../../Models/PokemonModel.dart';

class TrapPut extends StatelessWidget {
  final TallGrassModel tallGrassModel;

  const TrapPut({
    Key? key,
    required this.tallGrassModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String image;

    DateTime now = DateTime.now();
    DateTime catchTime = tallGrassModel.catchTime.toDate();
    Duration duration = catchTime.difference(now);
    TrapService trapService = TrapService();
    PokemonServices pokemonServices = PokemonServices();
    PlayerServices playerServices = PlayerServices();
    PokedexServices pokedexServices = PokedexServices();
    StreamController<bool> _controller = StreamController();

    if (duration.isNegative) {
      return StreamBuilder<bool>(
          stream: _controller.stream,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<TrapModel>(
                      future:
                          trapService.getTrapById(tallGrassModel.idTrapModel),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        } else {
                          final TrapModel trapModel = snapshot.data!;
                          image = trapModel.url;
                          return Container(
                              height: 50,
                              width: 50,
                              child: Image.network(image));
                        }
                      }),
                  Text(tallGrassModel.nameTrapModel),
                  Text('Ville : ${tallGrassModel.city}'),
                  ElevatedButton(
                    onPressed: snapshot.data == null
                        ? () async {
                            _controller.add(false);
                            PlayerModel playerModel =
                                await playerServices.getPlayer;
                            if (tallGrassModel.city == playerModel.city) {
                              bool trapBroken = await trapService.removeTrap(
                                  tallGrassModel.idTrapModel,
                                  tallGrassModel.id);
                              if (trapBroken == false) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Oups'),
                                    content: const Text(
                                        'J\'ai l\'impression que le pokémon à reussi à s\'échaper en cassant ton piège...'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TallGrass())),
                                        child: const Text('OK'),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                TrapModel trapModel = await trapService
                                    .getTrapById(tallGrassModel.idTrapModel);

                                PokemonModel pokemonCatch =
                                    await pokemonServices.catchPokemon(
                                        trapModel, tallGrassModel.city);
                                String urlImage = await pokemonServices
                                    .getUrlImage(pokemonCatch);
                                await pokedexServices.addPokemon(pokemonCatch);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Félicitation'),
                                    content: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            'Tu viens d\'attraper un ${pokemonCatch.name}'),
                                        Image.network(urlImage)
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TallGrass())),
                                        child: const Text('OK'),
                                      )
                                    ],
                                  ),
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Attention'),
                                  content: Text(
                                      'Il faut que tu soit à ${tallGrassModel.city} pour récupérer ce piège!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    )
                                  ],
                                ),
                              );
                            }
                          }
                        : null,
                    child: Text('Récupérer'),
                  )
                ],
              ),
            );
          });
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<TrapModel>(
              future: trapService.getTrapById(tallGrassModel.idTrapModel),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  final TrapModel trapModel = snapshot.data!;
                  image = trapModel.url;
                  return Container(
                      height: 50, width: 50, child: Image.network(image));
                }
              }),
          Text(tallGrassModel.nameTrapModel),
          (Text('00:01:00')),
          Text('Ville : ${tallGrassModel.city}')
        ],
      ),
    );
  }

  // String buidTime(Duration duration) {
  //   String twoDigits(int n) => n.toString().padLeft(2, "0");
  //   String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  //   String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  //   return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  // }
}
