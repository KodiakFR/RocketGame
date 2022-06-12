import 'package:flutter/material.dart';

class Widget_CardProfil extends StatelessWidget {
  final String libelle;
  final String value;
  const Widget_CardProfil(
      {Key? key, required this.libelle, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 220,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        color: Colors.grey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            '$libelle : $value',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              
            ),
          ),
        ),
      ),
    );
  }
}
