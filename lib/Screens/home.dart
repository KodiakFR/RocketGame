import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Screens/connexion.dart';
import 'package:team_rocket_game/Screens/profil.dart';
import 'package:team_rocket_game/Screens/tallGrass.dart';
import 'package:team_rocket_game/Screens/test.dart';
import 'package:team_rocket_game/Services/playerServices.dart';
import 'package:team_rocket_game/Services/userServices.dart';
import 'package:team_rocket_game/Widgets/Banners/profilBanner.dart';
import 'package:team_rocket_game/Widgets/Button/IconBtnWithTitle.dart';
import 'package:team_rocket_game/Widgets/Banners/menuBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

enum settings {
  logout,
}

class _HomeState extends State<Home> {
  PlayerServices playerServices = PlayerServices();
  final UserServices _userServices = UserServices();

  //Images
  late Image backgroundImage;
  late Image iconPokeCoin;
  late Image iconPokeBallRocket;
  late Image iconHauteHerbe;
  late Image iconGiovani;
  late Image iconProfil;
  late Image iconAcceuil;
  late Image iconPokeShop;
  late Image iconVente;
  late Image iconMessage;
  late Image iconTrain;

  @override
  void initState() {
    super.initState();
    backgroundImage = Image.asset('lib/IMG/Background/team_rocket_fanart.png');
    iconPokeCoin = Image.asset('lib/IMG/Icons/IconPokeCoin.png');
    iconPokeBallRocket = Image.asset('lib/IMG/Icons/IconPokeballrocket.png');
    iconHauteHerbe = Image.asset('lib/IMG/Icons/IconHauteHerbes.png');
    iconGiovani = Image.asset('lib/IMG/Icons/iconGiovani.png');
    iconProfil = Image.asset('lib/IMG/Icons/IconProfil.png');
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
    precacheImage(iconGiovani.image, context);
    precacheImage(iconHauteHerbe.image, context);
    precacheImage(iconPokeBallRocket.image, context);
    precacheImage(iconPokeCoin.image, context);
    precacheImage(iconProfil.image, context);
    precacheImage(iconAcceuil.image, context);
    precacheImage(iconMessage.image, context);
    precacheImage(iconPokeShop.image, context);
    precacheImage(iconTrain.image, context);
    precacheImage(iconVente.image, context);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<PlayerModel>(
            future: playerServices.getPlayer,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final PlayerModel playerModel = snapshot.data!;
                return Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('lib/IMG/Background/team_rocket_fanart.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PopupMenuButton<settings>(
                                icon: const Icon(Icons.settings),
                                iconSize: height/30,
                                color: Colors.grey,
                                onSelected: (settings result) {
                                  setState(() {
                                    var _section = result;
                                    if (_section == settings.logout) {
                                      _userServices.logout();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Connexion(),
                                          ));
                                    }
                                  });
                                },
                                itemBuilder: (context) =>
                                    <PopupMenuEntry<settings>>[
                                  const PopupMenuItem<settings>(
                                    value: settings.logout,
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ProfilBanner(playerModel: playerModel),
                        ],
                      ),
      
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconBtnWithTitle(
                                height: height/6,
                                width: width/6,
                                linkImage: 'lib/IMG/Icons/iconGiovani.png',
                                onChangedLink: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Test(),
                                      ))
                                },
                                name: 'Giovani',
                                sizePolice: width/35,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TallGrass(),
                                      ));
                                },
                                child:  Image(
                                  width: height/5,
                                  height: width/5,
                                  image: const AssetImage(
                                      'lib/IMG/Icons/IconHauteHerbes.png'),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red.withOpacity(0),
                                    elevation: 0,
                                    padding: const EdgeInsets.all(0)),
                              ),
                              IconBtnWithTitle(
                                  height: height/6,
                                  width: width/6,
                                  name: 'Profil',
                                  sizePolice: width/35,
                                  linkImage: 'lib/IMG/Icons/IconProfil.png',
                                  onChangedLink: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profil(
                                                playerModel: playerModel)));
                                  })
                            ],
                          ),
                           SizedBox(
                            height: height/15,
                          ),
                          MenuBar(height: height, width: width),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('lib/IMG/Background/team_rocket_fanart.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
              child: const Center(child:CircularProgressIndicator()));
            },
          ),
        ),
      ),
    );
  }
}
