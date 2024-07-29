import 'package:flutter/material.dart';

class AppcustomizeState extends ChangeNotifier {
  Color _textColor = Colors.white;
  Color _backgroundColor = Colors.blue;
  String _text = 'AppBar';

  Color get textColor => _textColor;
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
}
