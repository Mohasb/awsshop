import 'package:flutter/material.dart';

class AppcustomizeState extends ChangeNotifier {
  Color _textColor = Colors.black;
  double  _fontSize = 30;
  Color _backgroundColor = Colors.transparent;
  String _text = 'Awsshop';

  Color get textColor => _textColor;
  double get fontSize => _fontSize;
  Color get backgroundColor => _backgroundColor;
  String get text => _text;

  void updateTextColor(Color color) {
    _textColor = color;
    notifyListeners();
  }

  void updateBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }

  void updateText(String text) {
    _text = text;
    notifyListeners();
  }

  void updateFontSize(double fontsize) {
    _fontSize = fontsize;
    notifyListeners();
  }
}
