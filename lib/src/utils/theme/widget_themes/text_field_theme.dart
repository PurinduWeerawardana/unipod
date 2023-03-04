import 'package:flutter/material.dart';
import 'package:kcroz/src/constants/colors.dart';

class KcrozTextFormFieldTheme {
  KcrozTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
  const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: kcrozSecondaryColor,
      floatingLabelStyle: TextStyle(color: kcrozSecondaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide (width: 2, color: kcrozSecondaryColor),
      )
  );


  static InputDecorationTheme darkInputDecorationTheme =
  const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: kcrozPrimaryColor,
      floatingLabelStyle: TextStyle(color: kcrozPrimaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide (width: 2, color: kcrozPrimaryColor),
      )
  );
}