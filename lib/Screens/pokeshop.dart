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
  late Image iconPokeCoin;
  late Image backgroundImage;
  bool menu = true;
  int dropdownValue = 1;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    backgroundImage = Image.asset('lib/IMG/Background/pokeshopBackground.jpeg');
    iconPokeCoin = Image.asset('lib/IMG/Icons/IconPokeCoin.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgroundImage.image, context);
    precacheImage(iconPokeCoin.image, context);
  }

  @override
  Widget build(BuildContext context) {
    final PlayerServices _playerServices = PlayerServices();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('lib/IMG/Background/pokeshopBackground.jpeg'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: const TitleCustom(title: 'PokeShop'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder<PlayerModel>(
                          future: _playerServices.getPlayer,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container();
                            } else {
                              final PlayerModel _playerModel = snapshot.data!;
                              return Text(
                                '${_playerModel.money}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height / 70,
                                    fontWeight: FontWeight.bold),
                              );
                            }
                          }),
                      SizedBox(
                        width: width / 60,
                      ),
                      Image.asset(
                        'lib/IMG/Icons/IconPokeCoin.png',
                        height: height / 50,
                      ),
                    ],
                  ),
                ),
                CustomGridList(
                  menu: menu,
                  onChangedDropdowValue: (value) => setState(() {
                    dropdownValue = value;
                  }),
                  onChangedTotalPrice: (value) => setState(() {
                    totalPrice = value;
                  }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 40),
                  child: Row(
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
                ),
                MenuBar(height: height, width: width)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
