import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PokedexModel.dart';
import 'package:team_rocket_game/Models/PokemonModel.dart';
import 'package:team_rocket_game/Services/pokedexService.dart';
import 'package:team_rocket_game/Widgets/Banners/menuBar.dart';
import 'package:team_rocket_game/Widgets/pokedex/WidgetDescription.dart';
import 'package:team_rocket_game/Widgets/pokedex/WidgetLeading.dart';
import 'package:team_rocket_game/Widgets/pokedex/WidgetTrailing.dart';

class Pokedex extends StatefulWidget {
  Pokedex({Key? key}) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    double offsetTop = (MediaQuery.of(context).size.height * 20) / 100;
    double offsetBot = (MediaQuery.of(context).size.height * 10) / 100;
    PokedexServices pokedexServices = PokedexServices();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/IMG/Background/pokedexBackground.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Container(
                  height: offsetTop,
                ),
                Flexible(
                  child: Container(
                    child: FutureBuilder<List<PokedexModel>>(
                        future: pokedexServices.getPokedexByUid(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: Text('Chargement...'));
                          } else {
                            final List<PokedexModel> pokemons = snapshot.data!;
                            List<PokedexModel> pokedex = [];
                            bool check = false;
                            for (var i = 1; i <= 150; i++) {
                              check = false;
                              pokemons.forEach((element) {
                                if (element.id == i) {
                                  PokedexModel pokedexModel = element;
                                  pokedex.add(pokedexModel);
                                  check = true;
                                }
                              });
                              if (check == false) {
                                PokedexModel pokedexModel =
                                    PokedexModel.NoDiscovered(
                                  i,
                                  "????????",
                                );
                                pokedex.add(pokedexModel);
                              }
                            }
                            return ListView.builder(
                              itemCount: pokedex.length,
                              itemBuilder: (context, index) {
                                final PokedexModel pokedexModel =
                                    pokedex[index];

                                return ListTile(
                                  leading:
                                      WidgetLeading(pokedexModel: pokedexModel),
                                  title: Text(pokedexModel.name),
                                  trailing: WidgetTrailing(
                                      pokedexModel: pokedexModel),
                                  onTap: () {
                                    if (pokedexModel.qantity != null) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                                title: Text(pokedexModel.name, textAlign: TextAlign.center,),
                                                content:  WidegetDescription(pokedexModel: pokedexModel),
                                                actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Retour'),
                                                child: const Text('Retour'),
                                              ),
                                            ]),
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          }
                        }),
                  ),
                ),
                Container(
                  height: offsetBot,
                ),
                MenuBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
