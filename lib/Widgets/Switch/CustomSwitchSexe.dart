import 'package:flutter/material.dart';

class CustomSwitchSexe extends StatelessWidget {
  final bool sexe;
  final Function(bool) onChangedSexe;

  const CustomSwitchSexe({
    Key? key,
    required this.sexe,
    required this.onChangedSexe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _genre = 'un garçon'; 
    Color _colorGenre = Colors.blue;
    return 
        Switch(
          value: sexe,
          onChanged: (value) {
              onChangedSexe(sexe);
              if (sexe == true) {
                _genre = 'un garçon';
                _colorGenre = Colors.blue;
              } else {
                _genre = 'une fille';
                _colorGenre = Colors.pink;
              }
          },
          activeColor: Colors.blue,
          inactiveThumbColor: Colors.pink,
          inactiveTrackColor: Colors.pink,
        );
       
  }
}
