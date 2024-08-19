import 'dart:convert';
import 'package:awsshop/components/admin/customice_tab/theme/app_theme_default.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeState extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.light;
  Map<String, dynamic> _customTheme = {};
  List<Map<String, dynamic>> _savedThemes = [];

  ThemeState() {
    _loadInitialData(); 
  }

  ThemeMode get currentThemeMode => _currentThemeMode;

  Map<String, dynamic> get currentTheme {
    if (_customTheme.isNotEmpty) {
      return _customTheme;
    }
    return _currentThemeMode == ThemeMode.light
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;
  }

  List<Map<String, dynamic>> get savedThemes => _savedThemes;

  void updateTheme(ThemeMode themeMode) {
    _currentThemeMode = themeMode;
    notifyListeners();
  }

  void updateCustomTheme(Map<String, dynamic> customTheme) {
    _customTheme = customTheme;
    notifyListeners();
  }

  void saveNewTheme(String name, Map<String, dynamic> theme) async {
    // Convert color values to integers
    final themeWithColors = theme.map((key, value) {
      if (value is Color) {
        return MapEntry(key, colorToInt(value));
      }
      return MapEntry(key, value);
    });

    _savedThemes.add({'name': name, 'theme': themeWithColors});
    await saveThemesToStorage();
    notifyListeners();
  }

  void loadTheme(Map<String, dynamic> theme) {
    // Convert color values from integers to Color objects
    _customTheme = theme.map((key, value) {
      if (value is int) {
        return MapEntry(key, intToColor(value));
      }
      return MapEntry(key, value);
    });
    notifyListeners();
  }

  Future<void> saveThemesToStorage() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final themeList = _savedThemes.map((themeData) {
      final themeMap = themeData['theme'].map((key, value) {
        if (value is Color) {
          return MapEntry(key, colorToInt(value));
        }
        return MapEntry(key, value);
      });
      return jsonEncode({
        'name': themeData['name'],
        'theme': themeMap,
      });
    }).toList();
    await prefs.setStringList('savedThemes', themeList);
  } catch (e) {
    print("Error saving themes: $e");
  }
}

  Future<void> loadThemesFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeList = prefs.getStringList('savedThemes') ?? [];
      _savedThemes = themeList
          .map((themeString) => jsonDecode(themeString))
          .cast<Map<String, dynamic>>()
          .toList();
      // Convert color values from integers to Color objects
      _savedThemes = _savedThemes.map((themeData) {
        return {
          'name': themeData['name'],
          'theme': themeData['theme'].map((key, value) {
            if (value is int) {
              return MapEntry(key, intToColor(value));
            }
            return MapEntry(key, value);
          }),
        };
      }).toList();
      notifyListeners();
    } catch (e) {
      print("Error loading themes: $e");
    }
  }

  void deleteTheme(String name) async {
    _savedThemes.removeWhere((themeData) => themeData['name'] == name);
    await saveThemesToStorage();
    notifyListeners();
  }

  int colorToInt(Color color) => color.value;
  Color intToColor(int value) => Color(value);

  void _loadInitialData() async {
    await loadThemesFromStorage();
  }
}
