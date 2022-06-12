import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Services/playerServices.dart';
import 'package:team_rocket_game/Widgets/Banners/menuBar.dart';
import 'package:team_rocket_game/Widgets/Banners/titleCustom.dart';
import 'package:team_rocket_game/Widgets/pokeShop/CustomGridList.dart';

class Pokeshop extends StatefulWidget {
  const Pokeshop({Key? key}) : super(key: key);

  @override
  State<Pokeshop> createState() => _PokeshopState();
}

class _PokeshopState extends State<Pokeshop> {
  late Image backgroundImage;
  bool menu = true;
  int dropdownValue = 1;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    backgroundImage = Image.asset('lib/IMG/Background/pokeshopBackground.jpeg');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgroundImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    final PlayerServices _playerServices = PlayerServices();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: const DecorationImage(
                  image:
                      AssetImage('lib/IMG/Background/pokeshopBackground.jpeg'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: const TitleCustom(title: 'PokeShop'),
                ),
                Container(
                  height: 30,
                  child: FutureBuilder<PlayerModel>(
                      future: _playerServices.getPlayer,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          final PlayerModel _playerModel = snapshot.data!;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${_playerModel.money}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset('lib/IMG/Icons/IconPokeCoin.png'),
                            ],
                          );
                        }
                      }),
                ),
                CustomGridList(
                  menu: menu,
                  onChangedDropdowValue: (value) => setState((){
                    dropdownValue = value;
                  }),
                  onChangedTotalPrice: (value) => setState((){
                    totalPrice = value;
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            menu = true;
                          });
                        },
                        child: Text('Pièges')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            menu = false;
                          });
                        },
                        child: Text('Pierre Evolution'))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: MenuBar(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
