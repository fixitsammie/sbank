import './color_scheme.dart';

import 'package:flutter/material.dart';

final ThemeData lightThemeDataCustom = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: lightColorScheme,
    primaryColor: lightColorScheme.primary,
    scaffoldBackgroundColor: lightColorScheme.surface,
    //textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
  );
}

final ThemeData darkThemeDataCustom = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: darkColorScheme,
    primaryColor: darkColorScheme.primary,
    scaffoldBackgroundColor: darkColorScheme.surface,
    //textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
  );
}
