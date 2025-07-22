import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primarySwatch,
          accentColor: accentColor,
          backgroundColor: backgroundLight,
          cardColor: backgroundLight,
        ),
        textTheme: TextTheme(
            headlineLarge: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(38.0),
                fontWeight: FontWeight.bold,
                color: primaryTextLight),
            headlineMedium: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(24.0),
                fontWeight: FontWeight.bold,
                color: accentTextLight),
            headlineSmall: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(20.0),
                fontWeight: FontWeight.bold,
                color: primaryTextLight),
            titleMedium: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(16.0),
                fontWeight: FontWeight.bold,
                color: primaryTextLight),
            titleSmall: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(14.0),
                fontWeight: FontWeight.bold,
                color: primaryTextLight),
            bodyLarge:
                GoogleFonts.montserrat(fontSize: context.fontSizeFromDesign(16.0), color: primaryTextLight),
            bodyMedium: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(14.0), color: secondaryTextLight),
            bodySmall: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(12.0), color: secondaryTextLight),
            labelLarge: GoogleFonts.montserrat()));
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primarySwatch: primarySwatch,
          accentColor: accentColor,
          backgroundColor: backgroundDark,
          cardColor: backgroundDark,
        ),
        textTheme: TextTheme(
            headlineLarge: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(38.0),
                fontWeight: FontWeight.bold,
                color: primaryTextDark),
            headlineMedium: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(24.0),
                fontWeight: FontWeight.bold,
                color: accentTextDark),
            headlineSmall: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(20.0),
                fontWeight: FontWeight.bold,
                color: primaryTextDark),
            titleMedium: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(16.0),
                fontWeight: FontWeight.bold,
                color: primaryTextDark),
            titleSmall: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(14.0),
                fontWeight: FontWeight.bold,
                color: primaryTextDark),
            bodyLarge:
                GoogleFonts.montserrat(fontSize: context.fontSizeFromDesign(16.0), color: primaryTextDark),
            bodyMedium: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(14.0), color: secondaryTextDark),
            bodySmall: GoogleFonts.montserrat(
                fontSize: context.fontSizeFromDesign(12.0), color: secondaryTextDark),
            labelLarge: GoogleFonts.montserrat()));
  }

  static void changeTheme() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }
}
