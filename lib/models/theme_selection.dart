import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_state.dart';

class ThemeSelection extends StatelessWidget {
  const ThemeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selecciona un Tema',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Tema Claro'),
            onTap: () {
              Provider.of<ThemeState>(context, listen: false).updateTheme(ThemeMode.light);
            },
          ),
          ListTile(
            title: const Text('Tema Oscuro'),
            onTap: () {
              Provider.of<ThemeState>(context, listen: false).updateTheme(ThemeMode.dark);
            },
          ),
        ],
      ),
    );
  }
}
