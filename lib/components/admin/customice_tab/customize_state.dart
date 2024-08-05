import 'package:flutter/material.dart';

class AppcustomizeState extends ChangeNotifier {
  Color _navTextColor = Colors.black;
  double  _navFontSize = 30;
  Color _navBackgroundColor = Colors.white;
  String _navText = 'Awsshop';


  Color get textColor => _navTextColor;
  double get fontSize => _navFontSize;
  Color get backgroundColor => _navBackgroundColor;
  String get text => _navText;




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
}
