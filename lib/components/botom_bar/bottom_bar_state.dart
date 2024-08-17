import 'package:flutter/material.dart';

class BottomBarState extends ChangeNotifier {
  //BotomBar
  Color _bgColorBottomBar = Colors.red;
  Color get bgColorBottomBar => _bgColorBottomBar;
  
  Color _colorWaterDropBottomBar = Colors.black;
  Color get colorWaterDropBottomBar => _colorWaterDropBottomBar;

  void updatecolorWaterDropBottomBar(Color color) {
    _colorWaterDropBottomBar = color;
    notifyListeners();
  }
  void updateBgColorBottomBar(Color color) {
    _bgColorBottomBar = color;
    notifyListeners();
  }
}