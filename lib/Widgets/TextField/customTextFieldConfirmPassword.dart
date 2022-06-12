import 'package:flutter/material.dart';

class CustomTextFieldConfirmPassword extends StatelessWidget {
  final String password;
  final String confirmPassword;
  final Function(String) onChangedPassword;
  final Function(bool) onChangedSecret;
  final bool isSecret;


  const CustomTextFieldConfirmPassword({
    Key? key,
    required this.password,
    required this.confirmPassword,
    required this.onChangedPassword,
    required this.onChangedSecret,
    required this.isSecret,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String labelText = 'Confirme Password';
    String hindText = 'Confirmez votre mot de passe';

    return TextFormField(
      onChanged: (value) {
        onChangedPassword(value);
      },
      validator: (value) => password != confirmPassword
          ? 'Please enter a valid password'
          : null,
      obscureText: isSecret,
      decoration: InputDecoration(
        suffix: InkWell(
          onTap: () {
              onChangedSecret(isSecret);
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
  }
}
