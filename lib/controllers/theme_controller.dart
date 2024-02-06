import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../creatives/colors.dart';

class ThemeController extends GetxController{

  RxBool dark = false.obs;

  final ThemeData lightTheme = ThemeData.from(colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: primarySwatch,
    accentColor: accentColor,
    backgroundColor: backgroundLight,
  ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.montserrat(fontSize: 36.0, fontWeight: FontWeight.bold, color: primaryTextLight),
        headlineMedium: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.bold, color: accentTextLight),
        headlineSmall: GoogleFonts.montserrat(fontSize: 20.0, fontWeight: FontWeight.bold, color: primaryTextLight),
        titleSmall: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.bold, color: primaryTextLight),
        bodyLarge: GoogleFonts.montserrat(fontSize: 16.0, color: primaryTextLight),
        bodyMedium: GoogleFonts.montserrat(fontSize: 14.0, color: secondaryTextLight),
        bodySmall: GoogleFonts.montserrat(fontSize: 12.0, color: secondaryTextLight),
      )
  );

  final ThemeData darkTheme = ThemeData.from(colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: primarySwatch,
    accentColor: accentColor,
    backgroundColor: backgroundDark
  ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.montserrat(fontSize: 36.0, fontWeight: FontWeight.bold, color: primaryTextDark),
        headlineMedium: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.bold, color: accentTextDark),
        headlineSmall: GoogleFonts.montserrat(fontSize: 20.0, fontWeight: FontWeight.bold, color: primaryTextDark),
        titleSmall: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.bold, color: primaryTextDark),
        bodyLarge: GoogleFonts.montserrat(fontSize: 16.0, color: primaryTextDark),
        bodyMedium: GoogleFonts.montserrat(fontSize: 14.0, color: secondaryTextDark),
        bodySmall: GoogleFonts.montserrat(fontSize: 12.0, color: secondaryTextDark),
      )
  );

  void changeTheme() {
    if (dark.isTrue) {
      Get.changeThemeMode(ThemeMode.light);
      dark.value = false;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      dark.value = true;
    }
  }

}