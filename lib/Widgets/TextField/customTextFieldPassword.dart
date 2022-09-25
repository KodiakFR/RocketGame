import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_rocket_game/bloC/user.bloc.dart';

import '../../bloC/Register.Bloc/iconPrivatePassword.bloc.dart';

class CustomTextFieldPassword extends StatelessWidget {
  const CustomTextFieldPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String labelText = 'Password';
    String hindText = 'Entrez votre mot de passe';

    return BlocBuilder<IconPrivatePasswordBloc, bool>(
      builder: (context, isSecret) {
        return TextFormField(
          onChanged: (value) {
            context.read<UserBloc>().onChangedPassword(value);
          },
          validator: (value) => value!.isEmpty || value.length < 6
              ? 'Please enter a valid password'
              : null,
          obscureText: isSecret,
          decoration: InputDecoration(
            suffix: InkWell(
              onTap: () {
                context.read<IconPrivatePasswordBloc>().onChangedSecret();
              },
              child: Icon(
                !isSecret ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            hintText: hindText,
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.red),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1)),
            ),
            focusedBorder: const OutlineInputBorder(
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
      },
    );
  }
}
