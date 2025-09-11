import 'package:flutter/material.dart';
import 'package:chat_app/themes/dark_mode.dart';
import 'package:chat_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData.brightness == Brightness.dark;

  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (isDarkMode) {
      _themeData = lightMode;
    } else {
      _themeData = darkMode;
    }
    notifyListeners();
  }
}
