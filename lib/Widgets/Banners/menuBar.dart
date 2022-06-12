import 'package:flutter/material.dart';
import 'package:team_rocket_game/Screens/home.dart';
import 'package:team_rocket_game/Screens/pokeshop.dart';


class MenuBar extends StatelessWidget {
  const MenuBar({
    Key? key,
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
    
      children: [
        
        Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              child: Image(
                height: 40,
                width: 40,
                image: AssetImage('lib/IMG/Icons/IconAccueil.png'),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  primary: Colors.red.withOpacity(0),
                  elevation: 0),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(top: 55),
              padding: EdgeInsets.only(left: 1, right: 1),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                'Acceuil',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pokeshop()));
              },
              child: Image(
                height: 60,
                width: 60,
                image: AssetImage('lib/IMG/Icons/IconPokeshop.png'),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  primary: Colors.red.withOpacity(0),
                  elevation: 0),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(top: 55),
              padding: EdgeInsets.only(left: 1, right: 1),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                'Pokeshop',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('lien vers vente');

              },
              child: Image(
                height: 45,
                width: 45,
                image: AssetImage('lib/IMG/Icons/IconVente.png'),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  primary: Colors.red.withOpacity(0),
                  elevation: 0),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(top: 55),
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                'Vente',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('lien vers Message');
              },
              child: Image(
                height: 60,
                width: 60,
                image: AssetImage('lib/IMG/Icons/IconMessage.png'),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  primary: Colors.red.withOpacity(0),
                  elevation: 0),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(top: 55),
              padding: EdgeInsets.only(left: 1, right: 1),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                'Messages',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('lien vers Gare');
              },
              child: Image(
                height: 60,
                width: 60,
                image: AssetImage('lib/IMG/Icons/IconTrain.png'),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  primary: Colors.red.withOpacity(0),
                  elevation: 0),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(top: 55),
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                'Gare',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
