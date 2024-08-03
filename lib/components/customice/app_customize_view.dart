
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:awsshop/components/customice/app_customize_state.dart';

class EditAppBarScreen extends StatelessWidget {
  const EditAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarState = Provider.of<AppcustomizeState>(context);
    final TextEditingController textController = TextEditingController(text: appBarState.text);
    final TextEditingController fontSizeController = TextEditingController(text: appBarState.fontSize.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar AppBar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Texto AppBar'),
                controller: textController,
                onChanged: (value) {
                  appBarState.updateText(value);
                },
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Text("Color de Texto:"),
                  ColorPicker(
                    pickerColor: appBarState.textColor,
                    onColorChanged: (color) {
                      appBarState.updateTextColor(color);
                    },
                    labelTypes: const [],
                    pickerAreaHeightPercent: 0.8,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Text("Color de Fondo:"),
                  ColorPicker(
                    pickerColor: appBarState.backgroundColor,
                    onColorChanged: (color) {
                      appBarState.updateBackgroundColor(color);
                    },
                    labelTypes: const [],
                    pickerAreaHeightPercent: 0.8,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(labelText: 'Tamaño de Fuente'),
                controller: fontSizeController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  double? newSize = double.tryParse(value);
                  if (newSize != null) {
                    appBarState.updateFontSize(newSize);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
