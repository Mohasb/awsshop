import 'package:awsshop/components/admin/customice_tab/theme/app_theme_default.dart';
import 'package:awsshop/components/admin/customice_tab/theme/theme_state.dart';
import 'package:flutter/material.dart';

class DrawerState extends ChangeNotifier {
  final ThemeState themeState;

  DrawerState(this.themeState) {
    themeState.addListener(_updateTheme);
    _updateTheme();
  }

  Color _textColorDrawer = AppTheme.lightTheme['drawerTextColor'] as Color;
  Color get textColorDrawer => _textColorDrawer;

  Color _backgroundColorDrawer = AppTheme.lightTheme['drawerBackgroundColor'] as Color;
  Color get backgroundColorDrawer => _backgroundColorDrawer;

  void _updateTheme() {
    final themeMap = themeState.currentThemeMode == ThemeMode.light
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;

    _textColorDrawer = themeMap['drawerTextColor'] as Color;
    _backgroundColorDrawer = themeMap['drawerBackgroundColor'] as Color;

    notifyListeners();
  }

  void updateDrawerTextColor(Color color) {
    _textColorDrawer = color;
    notifyListeners();
  }

  void updateDrawerBackgroundColor(Color color) {
    _backgroundColorDrawer = color;
    notifyListeners();
  }

  @override
  void dispose() {
    themeState.removeListener(_updateTheme);
    super.dispose();
  }
}
