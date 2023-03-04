import 'package:flutter/material.dart';
import 'package:kcroz/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:kcroz/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:kcroz/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:kcroz/src/utils/theme/widget_themes/text_theme.dart';

class KcrozAppTheme {
  KcrozAppTheme._(); // user shouldn't access theme using an instance of the class

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: KcrozTextTheme.lightTextTheme,
    outlinedButtonTheme: KcrozOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: KcrozElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: KcrozTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: KcrozTextTheme.darkTextTheme,
    outlinedButtonTheme: KcrozOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: KcrozElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: KcrozTextFormFieldTheme.darkInputDecorationTheme,
  );
}
