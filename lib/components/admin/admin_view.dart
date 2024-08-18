import 'package:awsshop/components/admin/categories_tab/categories_view.dart';
import 'package:awsshop/components/admin/customice_tab/customice_view.dart';
import 'package:awsshop/components/admin/customice_tab/theme/app_theme_default.dart';
import 'package:awsshop/components/admin/products_tab/products_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customice_tab/theme/theme_state.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el estado del tema actual
    final themeState = Provider.of<ThemeState>(context);
    final theme = themeState.currentThemeMode == ThemeMode.light 
        ? AppTheme.lightTheme 
        : AppTheme.darkTheme;

    // Cast los valores del Map a Color
    final Color selectedLabelColor = theme['bottomBarWaterDropColor'] as Color;
    final Color unselectedLabelColor = selectedLabelColor.withOpacity(0.5); // Menos opacidad para los tabs no seleccionados

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Panel Administración'),
          bottom: TabBar(
            unselectedLabelColor: unselectedLabelColor,
            labelColor: selectedLabelColor,
            isScrollable: true,
            tabs: const [
              Tab(icon: Icon(Icons.format_paint), text: 'Estilos'),
              Tab(icon: Icon(Icons.category), text: 'Categorías'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'Productos'),
            ],
          ),
          backgroundColor: theme['appBarBackgroundColor'] as Color, // Asigna el color del fondo de AppBar
          titleTextStyle: TextStyle(
            color: theme['appBarTextColor'] as Color, 
            fontSize: theme['appBarFontSize'] as double,
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CustomiceTab(),
            ProductsTab(),
            CategoriesTab(),
          ],
        ),
      ),
    );
  }
}