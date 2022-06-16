import 'package:flutter/material.dart';
import 'package:team_rocket_game/Widgets/Banners/menuBar.dart';

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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'lib/IMG/Icons/IconPokeballrocket.png'))),
                                ),
                                SizedBox(width: 5,),
                                Text("001"),
                              ],
                            ),
                            Text('Bulbizard'),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F001%20-%20Bulbizar.png?alt=media&token=f32af28b-b442-487e-8fb9-0425662b4512'))),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'lib/IMG/Icons/IconPokeballrocket.png'))),
                                ),
                                SizedBox(width: 5,),
                                Text("002"),
                              ],
                            ),
                            Text('Herbizard'),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F002%20-%20Herbizar.png?alt=media&token=4eb7b964-2e23-4a92-b446-6d960921969c'))),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  
                                ),
                                SizedBox(width: 5,),
                                Text("003"),
                              ],
                            ),
                            Text('?????????'),
                            Container(
                              height: 30,
                              width: 30,
                            )
                          ],
                        ),
                      ],
                    ),
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
