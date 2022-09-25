import 'package:flutter/material.dart';
import 'package:team_rocket_game/Widgets/Banners/menuBar.dart';
import 'package:team_rocket_game/Widgets/Banners/titleCustom.dart';
import 'package:team_rocket_game/Widgets/Inventary/Widget_gridlist_Inventary.dart';
import 'package:team_rocket_game/Widgets/pokeShop/CustomGridList.dart';

class Inventary extends StatefulWidget {
  Inventary({Key? key}) : super(key: key);

  @override
  State<Inventary> createState() => _InventaryState();
}

class _InventaryState extends State<Inventary> {
  late Image backgroundImage;
  String menu = "Pièges";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    backgroundImage = Image.asset('lib/IMG/Background/background_profil.jpg');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(backgroundImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                    padding:
                        EdgeInsets.only(top: height / 20, bottom: height / 20),
                    child: const TitleCustom(title: 'Inventaire'),
                  ),
                  Widget_gridlist_Inventary(menu: menu),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              menu = "Pièges";
                            });
                          },
                          child: const Text('Pièges')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              menu = "Baies";
                            });
                          },
                          child: const Text('Baies')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              menu = "Pierres";
                            });
                          },
                          child: const Text('Pierres')),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              bottom: height / 50, right: width / 1.5),
                          width: width / 3.5,
                          child: Image.asset(
                              'lib/IMG/Inventary/InventaryImage.png')),
                      Padding(
                        padding: EdgeInsets.only(bottom: height / 40),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: Colors.red[700],
                            ),
                            iconSize: height/15,),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
