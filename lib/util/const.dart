import 'package:flutter/material.dart';

const bool const_debugMode = true;
const String const_appName = "Teste Uol";
const String const_apiKey = "e2b3d3f8fbea936f01252c2f5b0762bf";
const String BASE_URL = "https://api.themoviedb.org/3/";
const String BASE_IMG_URL = "https://www.themoviedb.org/t/p/w780/";


final uolTheme = ThemeData(

  primaryColor: const Color(0xFF161616),
  scaffoldBackgroundColor: const Color(0xFF161616),
  // brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.black12,
  textTheme: TextTheme(

    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white70,
      displayColor: Colors.white70,
      ),
);
final ThemeData const_theme = uolTheme;