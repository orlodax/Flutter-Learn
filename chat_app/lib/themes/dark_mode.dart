import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.grey.shade800,
    onPrimary: Colors.white,
    secondary: Colors.grey.shade700,
    onSecondary: Colors.white,
    surface: Colors.grey.shade900,
    onSurface: Colors.white,
    error: Colors.red.shade400,
    onError: Colors.black,
    tertiary: Colors.black,
    inversePrimary: Colors.grey.shade200,
  ),
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey[900],
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey[900], elevation: 0),
  textTheme: TextTheme(),
);
