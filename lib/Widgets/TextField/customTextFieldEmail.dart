import 'package:flutter/material.dart';

class CustomTextFieldEmail extends StatelessWidget {
  final String email;
  final Function(String) onChangeEmail;

  const CustomTextFieldEmail({
    Key? key,
    required this.email,
    required this.onChangeEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

    return TextFormField(
      onChanged: (String value) {
        onChangeEmail(value);
      },
      validator: (value) => value!.isEmpty || !emailRegex.hasMatch(value)
          ? 'Please enter a valid email'
          : null,
          keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Entrez votre Email',
        labelText: 'Email',
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
