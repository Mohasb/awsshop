import 'package:awsshop/components/admin/customice_tab/theme/app_theme_default.dart';
import 'package:awsshop/components/admin/customice_tab/theme/theme_state.dart';
import 'package:flutter/material.dart';

class BottomBarState extends ChangeNotifier {
  final ThemeState themeState;

  BottomBarState(this.themeState) {
    themeState.addListener(_updateTheme);
    _updateTheme(); 
  }

  Color _bgColorBottomBar = AppTheme.lightTheme['bottomBarBgColor'] as Color;
  Color get bgColorBottomBar => _bgColorBottomBar;

  Color _colorWaterDropBottomBar = AppTheme.lightTheme['bottomBarWaterDropColor'] as Color;
  Color get colorWaterDropBottomBar => _colorWaterDropBottomBar;

  void updatecolorWaterDropBottomBar(Color color) {
    _colorWaterDropBottomBar = color;
    notifyListeners();
  }

  void updateBgColorBottomBar(Color color) {
    _bgColorBottomBar = color;
    notifyListeners();
  }

  void _updateTheme() {
    final themeMap = themeState.currentThemeMode == ThemeMode.light
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;

    _bgColorBottomBar = themeMap['bottomBarBgColor'] as Color;
    _colorWaterDropBottomBar = themeMap['bottomBarWaterDropColor'] as Color;

    notifyListeners();
  }

  @override
  void dispose() {
    themeState.removeListener(_updateTheme);
    super.dispose();
  }
}
