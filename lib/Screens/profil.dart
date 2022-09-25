import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Screens/inventary.dart';
import 'package:team_rocket_game/Widgets/Banners/menuBar.dart';
import 'package:team_rocket_game/Widgets/Banners/titleCustom.dart';
import 'package:team_rocket_game/Widgets/Button/IconBtnWithTitle.dart';
import 'package:team_rocket_game/Widgets/Profil/Widget_CardProfil.dart';

import 'pokedex.dart';

class Profil extends StatefulWidget {
  PlayerModel playerModel;
  Profil({
    Key? key,
    required this.playerModel,
  }) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late Image backgroundImage;
  late Image profilImageBoy;
  late Image profilImageGirl;

  @override
  void initState() {
    super.initState();
    backgroundImage = Image.asset('lib/IMG/Background/background_profil.jpg');
    profilImageBoy = Image.asset('lib/IMG/Profil/boyProfil.png');
    profilImageGirl = Image.asset('lib/IMG/Profil/girlProfil.png');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    precacheImage(backgroundImage.image, context);
    precacheImage(profilImageBoy.image, context);
    precacheImage(profilImageGirl.image, context);
  }

  @override
  Widget build(BuildContext context) {
    late String imageprofil;
    late String genre;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (widget.playerModel.genre == true) {
      imageprofil = 'lib/IMG/Profil/boyProfil.png';
      genre = 'Garçon';
    } else {
      imageprofil = 'lib/IMG/Profil/girlProfil.png';
      genre = 'Fille';
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/IMG/Background/base_secrete.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: height/20),
                  child: const TitleCustom(title: "PROFIL"),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image.asset(imageprofil),
                    Padding(
                      padding:  EdgeInsets.only(bottom: height/3.5, left: width/2.5),
                      child: Column(
                        children: [
                          Widget_CardProfil(
                              libelle: 'Pseudo',
                              value: widget.playerModel.pseudo!),
                          Widget_CardProfil(libelle: 'Genre', value: genre),
                          Widget_CardProfil(
                              libelle: 'Level',
                              value: widget.playerModel.level.toString()),
                          Widget_CardProfil(
                              libelle: 'Argent',
                              value: widget.playerModel.money.toString()),
                          Widget_CardProfil(
                              libelle: 'Ville', value: widget.playerModel.city!),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(
                          bottom: height/10, left: width/2.5, right: width/8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconBtnWithTitle(
                            height: height/8,
                            width: width/5,
                            name: "Inventaire",
                            linkImage: "lib/IMG/Profil/sac_a_dos.png",
                            sizePolice: height/80,
                            onChangedLink: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Inventary()));
                            },
                          ),
                          IconBtnWithTitle(
                            height: height/8,
                            width: width/5,
                            name: "Pokédex",
                            sizePolice: height/80,
                            linkImage: 'lib/IMG/Icons/pokedex_close_icon.png',
                            onChangedLink: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pokedex()));
                            },
                          )
                        ],
                      ),
                    ),
                    MenuBar(height: height,width: width,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
