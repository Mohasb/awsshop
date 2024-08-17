import 'package:flutter/material.dart';

class DrawerState extends ChangeNotifier {
  

  // Drawer
  Color _textColorDrawer = Colors.black;
  Color _backgroundColorDrawer = Colors.red;

  Color get textColorDrawer => _textColorDrawer;
  Color get backgroundColorDrawer => _backgroundColorDrawer;

  void updateDrawerTextColor(Color color) {
    _textColorDrawer = color;
    notifyListeners();
  }

  void updateDrawerBackgroundColor(Color color) {
    _backgroundColorDrawer = color;
    notifyListeners();
  }



}
