import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awsshop/components/admin/customice_tab/theme/theme_state.dart';
import 'package:awsshop/components/app_bar/app_bar_state.dart';
import 'package:awsshop/components/botom_bar/bottom_bar_state.dart';
import 'package:awsshop/components/drawer/drawer_state.dart';

class ThemeSelection extends StatelessWidget {
  const ThemeSelection({super.key});


// Función para convertir int a Color
Color intToColor(int value) => Color(value);

// Función para aplicar el tema seleccionado
void _applySelectedTheme(BuildContext context, Map<dynamic, dynamic> selectedTheme) {
  final appBarState = Provider.of<AppBarState>(context, listen: false);
  final drawerState = Provider.of<DrawerState>(context, listen: false);
  final bottomBarState = Provider.of<BottomBarState>(context, listen: false);

  // Verifica y convierte 'appBarTextColor'
  appBarState.updateNavTextColor(
    selectedTheme['appBarTextColor'] is int
        ? intToColor(selectedTheme['appBarTextColor'] as int)
        : selectedTheme['appBarTextColor'] as Color,
  );

  // Manejo de 'appBarFontSize'
  appBarState.updateNavFontSize(
    (selectedTheme['appBarFontSize'] as num).toDouble(),
  );

  // Verifica y convierte 'appBarBackgroundColor'
  appBarState.updateNavBackgroundColor(
    selectedTheme['appBarBackgroundColor'] is int
        ? intToColor(selectedTheme['appBarBackgroundColor'] as int)
        : selectedTheme['appBarBackgroundColor'] as Color,
  );

  // Verifica y convierte 'appBarIconColor'
  appBarState.updateNavIconColor(
    selectedTheme['appBarIconColor'] is int
        ? intToColor(selectedTheme['appBarIconColor'] as int)
        : selectedTheme['appBarIconColor'] as Color,
  );

  // Manejo de 'appBarText'
  appBarState.updateNavText(
    selectedTheme['appBarText'] as String,
  );

  // Verifica y convierte 'drawerTextColor'
  drawerState.updateDrawerTextColor(
    selectedTheme['drawerTextColor'] is int
        ? intToColor(selectedTheme['drawerTextColor'] as int)
        : selectedTheme['drawerTextColor'] as Color,
  );

  // Verifica y convierte 'drawerBackgroundColor'
  drawerState.updateDrawerBackgroundColor(
    selectedTheme['drawerBackgroundColor'] is int
        ? intToColor(selectedTheme['drawerBackgroundColor'] as int)
        : selectedTheme['drawerBackgroundColor'] as Color,
  );

  // Verifica y convierte 'bottomBarBgColor'
  bottomBarState.updateBgColorBottomBar(
    selectedTheme['bottomBarBgColor'] is int
        ? intToColor(selectedTheme['bottomBarBgColor'] as int)
        : selectedTheme['bottomBarBgColor'] as Color,
  );

  // Verifica y convierte 'bottomBarWaterDropColor'
  bottomBarState.updatecolorWaterDropBottomBar(
    selectedTheme['bottomBarWaterDropColor'] is int
        ? intToColor(selectedTheme['bottomBarWaterDropColor'] as int)
        : selectedTheme['bottomBarWaterDropColor'] as Color,
  );
}

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);

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
              Provider.of<ThemeState>(context, listen: false)
                  .updateTheme(ThemeMode.light);
            },
          ),
          ListTile(
            title: const Text('Tema Oscuro'),
            onTap: () {
              Provider.of<ThemeState>(context, listen: false)
                  .updateTheme(ThemeMode.dark);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Temas Guardados',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          ...themeState.savedThemes.map((themeData) {
            return ListTile(
              title: Text(themeData['name']),
              onTap: () {
                _applySelectedTheme(context, themeData['theme']);
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  themeState.deleteTheme(themeData['name']);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
