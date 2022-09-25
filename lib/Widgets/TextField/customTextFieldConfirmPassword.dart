import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_rocket_game/Models/UserModel.dart';
import 'package:team_rocket_game/bloC/user.bloc.dart';

import '../../bloC/Register.Bloc/iconPrivatePassword.bloc.dart';
import '../../bloC/Register.Bloc/textFieldConfirmPassword.bloc.dart';


class CustomTextFieldConfirmPassword extends StatelessWidget {
  const CustomTextFieldConfirmPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String labelText = 'Confirme Password';
    String hindText = 'Confirmez votre mot de passe';

    return BlocBuilder<IconPrivatePasswordBloc, bool>(
        builder: (context, isSecret) {
      return BlocBuilder<UserBloc, UserModel>(
          builder: (context, UserBloc) {
        return TextFormField(
          onChanged: (value) {
            context
                .read<TextFieldConfirmPasswordBloc>()
                .onChangedConfirmPassword(value);
          },
          validator: (value) =>
              UserBloc.password != value ? 'Please enter a valid password' : null,
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
      });
    });
  }
}
