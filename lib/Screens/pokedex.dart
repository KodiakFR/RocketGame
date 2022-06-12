import 'package:flutter/material.dart';

class Pokedex extends StatefulWidget {
  Pokedex({Key? key}) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center()),
    );
  }
}