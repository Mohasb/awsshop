import 'package:awsshop/components/admin/customice_tab/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveThemeDialog extends StatelessWidget {
  final Map<String, dynamic> themeToSave;

  const SaveThemeDialog({super.key, required this.themeToSave});

  @override
  Widget build(BuildContext context) {
    final TextEditingController themeNameController = TextEditingController();

    return AlertDialog(
      title: const Text('Guardar Tema'),
      content: TextField(
        controller: themeNameController,
        decoration: const InputDecoration(hintText: 'Nombre del tema'),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Guardar'),
          onPressed: () {
            if (themeNameController.text.isNotEmpty) {
              final themeState = Provider.of<ThemeState>(context, listen: false);
              themeState.saveNewTheme(themeNameController.text, themeToSave);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}