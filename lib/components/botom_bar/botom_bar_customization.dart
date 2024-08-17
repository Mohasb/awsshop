import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
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
                const Text(
                  'Color de gota:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ColorPicker(
                  pickerColor: _waterDropColor,
                  paletteType: PaletteType.hueWheel,
                  onColorChanged: (color) {
                    setState(() {
                      _waterDropColor = color;
                    });
                    widget.onWaterDropColor(color);
                  },
                  labelTypes: const [],
                  pickerAreaHeightPercent: 0.8,
                  enableAlpha:
                      false,
                  displayThumbColor:
                      true,
                      hexInputBar: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
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
                const Text(
                  'Color de Fondo:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ColorPicker(
                  pickerColor: _backgroundColor,
                  paletteType: PaletteType.hueWheel,
                  onColorChanged: (color) {
                    setState(() {
                      _backgroundColor = color;
                    });
                    widget.onBackgroundColorChange(color);
                  },
                  labelTypes: const [],
                  pickerAreaHeightPercent: 0.8,
                  enableAlpha:
                      false,
                  displayThumbColor:
                      true,
                      hexInputBar: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9, // 80% del ancho
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
}
