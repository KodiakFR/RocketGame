import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  final String title;
  const TitleCustom({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(right: 50, top: 35),
          margin: EdgeInsets.only(left: 15),
          height: 105,
          width: 330,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: 105,
          width: 105,
          margin: EdgeInsets.only(
            left: 275,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'lib/IMG/Icons/IconPokeballrocket.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
    ;
  }
}
