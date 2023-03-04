import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

// Light & Dark Outlined Button Themes
class KcrozOutlinedButtonTheme {
  KcrozOutlinedButtonTheme._(); //To avoid creating instances

  // Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: kcrozSecondaryColor,
      side: const BorderSide(color: kcrozSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: kcrozButtonHeight),
    ),
  );
  // Derk Them
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: kcrozWhiteColor,
      side: const BorderSide(color: kcrozWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: kcrozButtonHeight),
    ),
  );
}