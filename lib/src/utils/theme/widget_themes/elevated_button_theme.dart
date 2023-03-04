import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

// Light & Dark Elevated Button Themes
class KcrozElevatedButtonTheme {
  KcrozElevatedButtonTheme._(); //To avoid creating instances

  // Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: kcrozWhiteColor,
      backgroundColor: kcrozSecondaryColor,
      side: const BorderSide(color: kcrozSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: kcrozButtonHeight),
    ),
  );

  // Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: kcrozSecondaryColor,
      backgroundColor: kcrozWhiteColor,
      side: const BorderSide(color: kcrozWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: kcrozButtonHeight),
    ),
  );
}