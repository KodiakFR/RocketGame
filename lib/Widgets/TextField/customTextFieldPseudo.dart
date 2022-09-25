import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_rocket_game/bloC/playerBloc.dart';


class CustomTextFieldPseudo extends StatelessWidget {
  const CustomTextFieldPseudo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<PlayerBloc>().onChangedPseudo(value);
      },
      validator: (value) => value!.isEmpty ? 'Please enter a pseudo' : null,
      decoration: const InputDecoration(
        hintText: "Entrez votre Pseudo",
        labelText: 'Pseudo',
        labelStyle: TextStyle(color: Colors.red),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.bottom,
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
