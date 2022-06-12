import 'package:flutter/material.dart';

class CustomTextFieldPseudo extends StatelessWidget {
  final String name;
  final Function(String) onChangedPseudo;
  const CustomTextFieldPseudo({
    Key? key,
    required this.name,
    required this.onChangedPseudo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChangedPseudo(value);
      },
      validator: (value) => value!.isEmpty ? 'Please enter a pseudo' : null,
      decoration: InputDecoration(
        hintText: 'Entrez votre Pseudo',
        labelText: 'Pseudo',
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
