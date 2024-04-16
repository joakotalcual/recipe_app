
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  // Atributos de la clase InputText
  final String label;
  final TextInputType keyboardType;
  final int maxLength;
  final bool obscureText;
  final bool borderEnabled;
  final double fontSize;
  final void Function(String text)? onChanged;
  final String? Function(String? text)? validator;
  final TextEditingController? controller;
  // Constructor de la clase InputText
  const InputText({
    super.key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.borderEnabled = true,
    this.fontSize = 15,
    this.maxLength = 10,
    this.onChanged,
    this.validator,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
      style: TextStyle(fontSize: fontSize),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}