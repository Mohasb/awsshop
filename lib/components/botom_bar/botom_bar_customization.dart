import 'package:awsshop/components/utils_comp/horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../admin/customice_tab/theme/app_theme_default.dart';
import '../admin/customice_tab/theme/theme_state.dart';

class BotomBarCustomization extends StatefulWidget {
  final Color backgroundColor;
  final Color waterDropColor;
  final Function(Color backgroundColor) onBackgroundColorChange;
  final Function(Color waterDropColor) onWaterDropColor;
  final VoidCallback onSave;

  const BotomBarCustomization({
    super.key,
    required this.backgroundColor,
    required this.waterDropColor,
    required this.onBackgroundColorChange,
    required this.onWaterDropColor,
    required this.onSave,
  });

  @override
  BotomBarCustomizationState createState() => BotomBarCustomizationState();
}

class BotomBarCustomizationState extends State<BotomBarCustomization> {
  late Color _waterDropColor;
  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _waterDropColor = widget.waterDropColor;
    _backgroundColor = widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final theme = themeState.currentThemeMode == ThemeMode.light
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;

    final Color textColor = theme['appBarTextColor'] as Color;
    final Color backgroundColor = theme['appBarBackgroundColor'] as Color;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          HorizontalLine(
            height: 10,
            label: "COLOR DE GOTA",
            textColor: textColor,
          ),
          _buildColorPicker(
            currentColor: _waterDropColor,
            backgroundColor: backgroundColor,
            textColor: textColor,
            onColorChanged: (color) {
              setState(() {
                _waterDropColor = color;
              });
              widget.onWaterDropColor(color);
            },
          ),
          const SizedBox(height: 20),
          HorizontalLine(
            height: 10,
            label: "COLOR DE FONDO",
            textColor: textColor,
          ),
          _buildColorPicker(
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
              width: MediaQuery.of(context).size.width * 0.9, // 90% del ancho
              child: ElevatedButton(
                onPressed: widget.onSave,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                    'Modificar'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPicker({
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


