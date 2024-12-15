import 'package:flutter/material.dart';

class ThemeConstants {
  static const Color clrTransparent = Colors.transparent;
  static const Color clrBlack = Colors.black;

  static const Color clrWhite = Colors.white;
  static const Color clrBlue = Colors.blue;
  static const Color clrYellow = Colors.yellow;
  static const Color clrBlueGrey = Colors.blueGrey;
  static const Color clrGrey = Colors.grey;
  static const Color clrBrown = Colors.brown;
  static const Color clrLightBlue = Color.fromARGB(255, 131, 175, 195);

  static const Color clrBlack100 = Color(0xFF0C131A);
  static const Color clrDarkBlueGrey = Color(0xFF0E1720);
  static const Color clrLightBlueGrey = Color(0xFF1A2938);
  static const Color clrAmberYellow = Color(0xFFE7A12C);
}

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: ThemeConstants.clrDarkBlueGrey,
    titleTextStyle: TextStyle(color: ThemeConstants.clrWhite, fontSize: 20),
  ),
  primaryColor: ThemeConstants.clrLightBlueGrey,
  primaryColorDark: ThemeConstants.clrDarkBlueGrey,
  useMaterial3: true,
  scaffoldBackgroundColor: ThemeConstants.clrBlack100,
  colorScheme: ColorScheme.fromSeed(seedColor: ThemeConstants.clrLightBlueGrey),
);
