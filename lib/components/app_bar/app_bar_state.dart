import 'package:awsshop/components/admin/customice_tab/theme/app_theme_default.dart';
import 'package:awsshop/components/admin/customice_tab/theme/theme_state.dart';
import 'package:flutter/material.dart';

class AppBarState extends ChangeNotifier {
  final ThemeState themeState;

  AppBarState(this.themeState) {
    themeState.addListener(_updateTheme);
    _updateTheme();
  }

  Color _navTextColor = AppTheme.lightTheme['appBarTextColor'] as Color;
  double _navFontSize = AppTheme.lightTheme['appBarFontSize'] as double;
  Color _navBackgroundColor = AppTheme.lightTheme['appBarBackgroundColor'] as Color;
  String _navText = AppTheme.lightTheme['appBarText'] as String;
  Color _iconsColor = AppTheme.lightTheme['appBarIconColor'] as Color;

  Color get textColor => _navTextColor;
  double get fontSize => _navFontSize;
  Color get backgroundColor => _navBackgroundColor;
  String get text => _navText;
  Color get iconsColor => _iconsColor;

  void _updateTheme() {
    final themeMap = themeState.currentThemeMode == ThemeMode.light
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;

    _navTextColor = themeMap['appBarTextColor'] as Color;
    _navBackgroundColor = themeMap['appBarBackgroundColor'] as Color;
    _navFontSize = themeMap['appBarFontSize'] as double;
    _navText = themeMap['appBarText'] as String;
    _iconsColor = themeMap['appBarIconColor'] as Color;

    notifyListeners();
  }

  void updateNavIconColor(Color color) {
    _iconsColor = color;
    notifyListeners();
  }

  void updateNavTextColor(Color color) {
    _navTextColor = color;
    notifyListeners();
  }

  void updateNavBackgroundColor(Color color) {
    _navBackgroundColor = color;
    notifyListeners();
  }

  void updateNavText(String text) {
    _navText = text;
    notifyListeners();
  }

  void updateNavFontSize(double fontsize) {
    _navFontSize = fontsize;
    notifyListeners();
  }

  @override
  void dispose() {
    themeState.removeListener(_updateTheme);
    super.dispose();
  }
}
