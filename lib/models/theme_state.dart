import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  // Define el tema actual
  ThemeMode _currentThemeMode = ThemeMode.light;

  // Getters
  ThemeMode get currentThemeMode => _currentThemeMode;

  // Métodos para actualizar el tema
  void updateTheme(ThemeMode themeMode) {
    _currentThemeMode = themeMode;
    notifyListeners();
  }
}
