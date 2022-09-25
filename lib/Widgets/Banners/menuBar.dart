import 'package:flutter/material.dart';
import 'package:team_rocket_game/Widgets/Button/IconBtnWithTitle.dart';


class MenuBar extends StatelessWidget {
  final double height;
  final double width;
  const MenuBar({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width/35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconBtnWithTitle(
            height: height / 9,
            width: width / 9,
            name: 'Accueil',
            sizePolice: width / 35,
            linkImage: 'lib/IMG/Icons/IconAccueil.png',
            onChangedLink: () =>
                {Navigator.pushReplacementNamed(context, '/home')},
          ),
          IconBtnWithTitle(
            height: height / 9,
            width: width / 9,
            name: 'Pokeshop',
            sizePolice: width / 35,
            linkImage: 'lib/IMG/Icons/IconPokeshop.png',
            onChangedLink: () =>
                {Navigator.pushReplacementNamed(context, '/pokeshop')},
          ),
          IconBtnWithTitle(
              height: height / 10,
              width: width / 10,
              name: 'Vente',
              sizePolice: width / 35,
              linkImage: 'lib/IMG/Icons/IconVente.png',
              onChangedLink: () =>
                  {Navigator.pushReplacementNamed(context, '/vente')}),
          IconBtnWithTitle(
              height: height / 10,
              width: width / 10,
              name: 'Message',
              sizePolice: width / 35,
              linkImage: 'lib/IMG/Icons/IconMessage.png',
              onChangedLink: () =>
                  Navigator.pushReplacementNamed(context, '/messages')),
          IconBtnWithTitle(
             height: height / 9,
              width: width / 9,
            name: 'Gare',
            sizePolice: width / 35,
            linkImage: 'lib/IMG/Icons/IconTrain.png',
            onChangedLink: () =>  Navigator.pushReplacementNamed(context, '/garestation')),
          
        ],
      ),
    );
  }
}
