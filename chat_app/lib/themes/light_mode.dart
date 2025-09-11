import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.grey.shade500,
    onPrimary: Colors.white,
    secondary: Colors.grey.shade200,
    onSecondary: Colors.black,
    surface: Colors.grey.shade300,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
  ),
  brightness: Brightness.light,
  primaryColor: Colors.grey[500],
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey[500], elevation: 0),
  textTheme: TextTheme(),
);
