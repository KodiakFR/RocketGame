import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_rocket_game/bloC/playerBloc.dart';
import 'package:team_rocket_game/bloC/user.bloc.dart';


class CustomTextFieldEmail extends StatelessWidget {
  const CustomTextFieldEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

    return TextFormField(
      onChanged: (String value) {
        context.read<UserBloc>().onChangedEmail(value);
      },
      validator: (value) => value!.isEmpty || !emailRegex.hasMatch(value)
          ? 'Please enter a valid email'
          : null,
          keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Entrez votre Email',
        labelText: 'Email',
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
