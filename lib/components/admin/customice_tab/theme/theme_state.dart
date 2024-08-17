import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.light;

  ThemeMode get currentThemeMode => _currentThemeMode;

  void updateTheme(ThemeMode themeMode) {
    _currentThemeMode = themeMode;
    notifyListeners();
  }
}
