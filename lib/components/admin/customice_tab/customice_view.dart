import 'package:awsshop/components/admin/customice_tab/customize_state.dart';
import 'package:awsshop/components/admin/customice_tab/nav_customization/nav_constumization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomiceTab extends StatefulWidget {
  const CustomiceTab({super.key});

  @override
  CustomiceTabState createState() => CustomiceTabState();
}

class CustomiceTabState extends State<CustomiceTab> {
  late TextEditingController textController;
  late TextEditingController fontSizeController;

  Color? _textColor;
  Color? _backgroundColor;
  String? _text;
  double? _fontSize;

  @override
  void initState() {
    super.initState();
    final appBarState = Provider.of<AppcustomizeState>(context, listen: false);
    textController = TextEditingController(text: appBarState.text);
    fontSizeController =
        TextEditingController(text: appBarState.fontSize.toString());
    _textColor = appBarState.textColor;
    _backgroundColor = appBarState.backgroundColor;
    _text = appBarState.text;
    _fontSize = appBarState.fontSize;
  }

  @override
  void dispose() {
    textController.dispose();
    fontSizeController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final appBarState = Provider.of<AppcustomizeState>(context, listen: false);
    if (_text != null) appBarState.updateText(_text!);
    if (_textColor != null) appBarState.updateTextColor(_textColor!);
    if (_backgroundColor != null) {
      appBarState.updateBackgroundColor(_backgroundColor!);
    }
    if (_fontSize != null) appBarState.updateFontSize(_fontSize!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: const Text(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  'Personalización del Navbar'),
              initiallyExpanded: false,
              children: [
                NavbarCustomization(
                  textController: textController,
                  fontSizeController: fontSizeController,
                  initialTextColor: _textColor!,
                  initialBackgroundColor: _backgroundColor!,
                  initialText: _text!,
                  initialFontSize: _fontSize!,
                  onTextChange: (text) => _text = text,
                  onTextColorChange: (color) => _textColor = color,
                  onBackgroundColorChange: (color) => _backgroundColor = color,
                  onFontSizeChange: (size) => _fontSize = size,
                  onSave: _saveChanges,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
