import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcroz/src/constants/colors.dart';

// Light and Dark Text Themes
class KcrozTextTheme {
  KcrozTextTheme._(); // To avoid creating instances

  static TextTheme lightTextTheme = TextTheme(
      headline1: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: kcrozDarkColor),
      headline2: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: kcrozDarkColor),
      headline3: GoogleFonts.poppins(fontSize:24.0, fontWeight: FontWeight.w700, color: kcrozDarkColor),
      headline4: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: kcrozDarkColor),
      headline6: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: kcrozDarkColor),
      bodyText1: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: kcrozDarkColor),
      bodyText2: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: kcrozDarkColor)
  );

  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: kcrozWhiteColor),
    headline2: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: kcrozWhiteColor),
    headline3: GoogleFonts.poppins(fontSize:24.0, fontWeight: FontWeight.w700, color: kcrozWhiteColor),
    headline4: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: kcrozWhiteColor),
    headline6: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: kcrozWhiteColor),
    bodyText1: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: kcrozWhiteColor),
    bodyText2: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: kcrozWhiteColor)
  );
}
