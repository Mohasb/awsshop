import 'package:awsshop/components/admin/customice_tab/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../admin/customice_tab/theme/app_theme_default.dart';

class NavbarCustomization extends StatefulWidget {
  final TextEditingController textController;
  final TextEditingController fontSizeController;
  final Color initialTextColor;
  final Color initialBackgroundColor;
  final String initialText;
  final double initialFontSize;
  final Function(String text) onTextChange;
  final Function(Color textColor) onTextColorChange;
  final Function(Color backgroundColor) onBackgroundColorChange;
  final Function(double fontSize) onFontSizeChange;
  final VoidCallback onSave;

  const NavbarCustomization({
    super.key,
    required this.textController,
    required this.fontSizeController,
    required this.initialTextColor,
    required this.initialBackgroundColor,
    required this.initialText,
    required this.initialFontSize,
    required this.onTextChange,
    required this.onTextColorChange,
    required this.onBackgroundColorChange,
    required this.onFontSizeChange,
    required this.onSave,
  });

  @override
  NavbarCustomizationState createState() => NavbarCustomizationState();
}

class NavbarCustomizationState extends State<NavbarCustomization> {
  late Color _textColor;
  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _textColor = widget.initialTextColor;
    _backgroundColor = widget.initialBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final theme = themeState.currentThemeMode == ThemeMode.light
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;

    final Color textColor = theme['appBarTextColor'] as Color;
    final Color backgroundColor = theme['appBarBackgroundColor'] as Color;
    final Color borderColor = theme['bottomBarWaterDropColor'] as Color;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                 BoxShadow(
                  color: borderColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Texto AppBar'),
                  controller: widget.textController,
                  style: TextStyle(color: textColor),
                  onChanged: (value) {
                    widget.onTextChange(value);
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Tamaño de Fuente'),
                  controller: widget.fontSizeController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: textColor),
                  onChanged: (value) {
                    double? newSize = double.tryParse(value);
                    if (newSize != null) {
                      widget.onFontSizeChange(newSize);
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildColorPicker(
            label: 'Color de Texto:',
            currentColor: _textColor,
            backgroundColor: backgroundColor,
            textColor: textColor,
            onColorChanged: (color) {
              setState(() {
                _textColor = color;
              });
              widget.onTextColorChange(color);
            },
          ),
          const SizedBox(height: 20),
          _buildColorPicker(
            label: 'Color de Fondo:',
            currentColor: _backgroundColor,
            backgroundColor: backgroundColor,
            textColor: textColor,
            onColorChanged: (color) {
              setState(() {
                _backgroundColor = color;
              });
              widget.onBackgroundColorChange(color);
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                onPressed: widget.onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  foregroundColor: textColor,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Modificar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPicker({
    required String label,
    required Color currentColor,
    required Color backgroundColor,
    required Color textColor,
    required ValueChanged<Color> onColorChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.1),
        border: Border.all(color: backgroundColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
          ),
          ColorPicker(
            pickerColor: currentColor,
            paletteType: PaletteType.hueWheel,
            onColorChanged: onColorChanged,
            labelTypes: const [],
            pickerAreaHeightPercent: 0.8,
            enableAlpha: false,
            displayThumbColor: true,
            hexInputBar: true,
          ),
        ],
      ),
    );
  }
}