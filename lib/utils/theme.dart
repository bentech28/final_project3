import 'package:flutter/material.dart';

// Définition des couleurs constantes
const Color mainColor = Color(0xff00BE84);
const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kColor1 = Color(0xff685959);  // Correction du nom de la constante pour uniformité
const Color kColor2 = Color(0xffADA79B);
const Color kColor3 = Color(0xffA5947F);
const Color kColor4 = Color(0xff738B71);
const Color kColor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class ThemesApp {
  // Thème clair
  static final ThemeData light = ThemeData(
    primaryColor: mainColor,
    scaffoldBackgroundColor: Colors.white,  // Utilisation de `scaffoldBackgroundColor` au lieu de `backgroundColor`
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: mainColor,
    ),
  );

  // Thème sombre
  static final ThemeData dark = ThemeData(
    primaryColor: darkGreyClr,
    scaffoldBackgroundColor: darkGreyClr,  // Utilisation de `scaffoldBackgroundColor` au lieu de `backgroundColor`
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkGreyClr,
    ),
  );
}
