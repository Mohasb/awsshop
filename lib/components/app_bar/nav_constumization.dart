import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                TextField(
                  decoration: const InputDecoration(labelText: 'Texto AppBar'),
                  controller: widget.textController,
                  onChanged: (value) {
                    setState(() {
                    });
                    widget.onTextChange(value);
                  },
                ),
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'Tamaño de Fuente'),
                  controller: widget.fontSizeController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    double? newSize = double.tryParse(value);
                    if (newSize != null) {
                      setState(() {
                      });
                      widget.onFontSizeChange(newSize);
                    }
                  },
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
                  'Color de Texto:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ColorPicker(
                  pickerColor: _textColor,
                  paletteType: PaletteType.hueWheel,
                  onColorChanged: (color) {
                    setState(() {
                      _textColor = color;
                    });
                    widget.onTextColorChange(color);
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
