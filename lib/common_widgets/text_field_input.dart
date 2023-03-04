import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  final Icon prefixIcon;

  const TextFieldInput(
      {
        Key? key,
        required this.textEditingController,
        required this.hintText,
        required this.textInputType,
        required this.prefixIcon,
        required this.labelText,
        this.isPassword = false,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder  = OutlineInputBorder(
        // borderSide: Divider.createBorderSide(context)
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        border: inputBorder,
        // focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        // filled: true,
        contentPadding: const EdgeInsets.all(20)
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}
