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
    if (_text != null) appBarState.updateNavText(_text!);
    if (_textColor != null) appBarState.updateNavTextColor(_textColor!);
    if (_backgroundColor != null) {
      appBarState.updateNavBackgroundColor(_backgroundColor!);
    }
    if (_fontSize != null) appBarState.updateNavFontSize(_fontSize!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fondo del contenedor
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent, 
                  ),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text(
                      'Personalización del Navbar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    initiallyExpanded: false,
                    iconColor: Colors.blueAccent, // Color del ícono de expansión
                    collapsedIconColor: Colors.blueAccent, // Color del ícono de expansión cuando está colapsado
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: NavbarCustomization(
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
