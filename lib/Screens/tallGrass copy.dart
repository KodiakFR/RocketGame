import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Services/playerServices.dart';
import 'package:team_rocket_game/Services/tallGrassServices.dart';
import 'package:team_rocket_game/Services/trapServices.dart';
import 'package:team_rocket_game/Widgets/Banners/menuBar.dart';
import 'package:team_rocket_game/Widgets/TallGrass/CustomGridView.dart';

import '../Models/TallGrassModel.dart';
import '../Widgets/Banners/titleCustom.dart';

class TallGrass extends StatefulWidget {
  TallGrass({Key? key}) : super(key: key);

  @override
  State<TallGrass> createState() => _TallGrassState();
}

PlayerServices _playerServices = PlayerServices();
TrapService _trapService = TrapService();
TallGrassServices _tallGrassServices = TallGrassServices();

class _TallGrassState extends State<TallGrass> {
  late Image backgroundImage;
  late Image iconPokeBallRocket;
  late Image iconAcceuil;
  late Image iconPokeShop;
  late Image iconVente;
  late Image iconMessage;
  late Image iconTrain;
  String? dropdownValue;
  Text? timer;

  @override
  void initState() {
    super.initState();
    backgroundImage =
        Image.asset('lib/IMG/Background/BackgroundTallGrass2.jpg');
    iconPokeBallRocket = Image.asset('lib/IMG/Icons/IconPokeballrocket.png');
    iconAcceuil = Image.asset('lib/IMG/Icons/IconAccueil.png');
    iconPokeShop = Image.asset('lib/IMG/Icons/IconPokeshop.png');
    iconVente = Image.asset('lib/IMG/Icons/IconVente.png');
    iconMessage = Image.asset('lib/IMG/Icons/IconMessage.png');
    iconTrain = Image.asset('lib/IMG/Icons/IconTrain.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgroundImage.image, context);
    precacheImage(iconPokeBallRocket.image, context);
    precacheImage(iconAcceuil.image, context);
    precacheImage(iconMessage.image, context);
    precacheImage(iconPokeShop.image, context);
    precacheImage(iconTrain.image, context);
    precacheImage(iconVente.image, context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<PlayerModel>(
            future: _playerServices.getPlayer,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                final PlayerModel _playerModel = snapshot.data!;
                return FutureBuilder<List<TrapModel>>(
                    future: _trapService.getAllTrapByUid(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      } else {
                        final List<TrapModel> _traps = snapshot.data!;
                        if (_traps.length > 0) {
                          dropdownValue = _traps[0].name;
                        }
                        return FutureBuilder<List<TallGrassModel>>(
                            future: _tallGrassServices.getAllTrapsTallGrass(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const CircularProgressIndicator();
                              } else {
                                final List<TallGrassModel> _AllTallGrass =
                                    snapshot.data!;
                                //Image background
                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'lib/IMG/Background/BackgroundTallGrass2.jpg'),
                                        fit: BoxFit.fitHeight),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(top: height/20),
                                        child: const TitleCustom(
                                            title: 'Hautes Herbes'),
                                      ),
                                          SizedBox(height: height/30,),
                                      CustomGridView(
                                       
                                      ),
                                      SizedBox(height: 10,),
                                     MenuBar(height: height,width: width,),
                                    ],
                                  ),
                                );
                              }
                            });
                      }
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
