import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Screens/home.dart';
import 'package:team_rocket_game/Services/playerServices.dart';
import 'package:team_rocket_game/Services/tallGrassServices.dart';
import 'package:team_rocket_game/Services/trapServices.dart';
import 'package:team_rocket_game/codeDataBase/pokemonDataBase.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  PlayerServices _playerServices = PlayerServices();
  TrapModel trapModel = TrapModel('jwrz3VrMPG25vOCEegyC', 'Pelle',
      'Pelle permetant de creuser un trou', 0, 'N', 80, 1, 2,200,'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FTrap%2FbA2EdQXnaJnfXX79dnta.png?alt=media&token=52c5650d-c128-44b7-8c0e-fadc98dd7ab0');
  TrapService trapService = TrapService();
  TallGrassServices tallGrassServices = TallGrassServices();
  String age = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<PlayerModel>(
          future: _playerServices.getPlayer,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final PlayerModel playerModel = snapshot.data!;
              return Column(
                children: [
                  Text(playerModel.pseudo!),
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    }),
                    child: Text("retour"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _playerServices.updateMoney(1000);
                    },
                    child: Text("test moneyPlayer"),
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      PokemonDataBase pokemonDataBase = PokemonDataBase();
                      pokemonDataBase.addAllPokemon();
                    }),
                    child: Text('addPokemonDataBase'),
                  ),
                 
                ],
              );
            }
            
            return Column(
              children: [
                Text('Loading'),
              ],
            );
          },
        ),
      ),
    );
  }
}
