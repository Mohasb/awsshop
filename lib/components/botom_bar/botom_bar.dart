import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class BotomBarNavigation extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;
  final Color backgroundColorBottomBar;
  final Color waterDropColorBottomBar;

  const BotomBarNavigation({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
    required this.backgroundColorBottomBar,
    required this.waterDropColorBottomBar,
  });

  @override
  State<BotomBarNavigation> createState() => _BotomBarNavigationState();
}

class _BotomBarNavigationState extends State<BotomBarNavigation> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          //this color must be equal to the WaterDropNavBar backgroundColor
          systemNavigationBarColor: widget.backgroundColorBottomBar,
          systemNavigationBarDividerColor: widget
              .waterDropColorBottomBar, // Color del divisor de la barra de navegación
          systemNavigationBarIconBrightness:
              Brightness.light, // Brillo de los iconos en la barra de navegación
          systemNavigationBarContrastEnforced:
              true, // Enforce contrast on the navigation bar
          statusBarColor: Colors.red, // Color de la barra de estado
          statusBarBrightness:
              Brightness.dark, // Brillo de la barra de estado (para iOS)
          statusBarIconBrightness: Brightness
              .light, // Brillo de los iconos de la barra de estado (para Android)
          systemStatusBarContrastEnforced:
              true, // Enforce contrast on the status bar
        ),
        child: WaterDropNavBar(
          barItems: [
            BarItem(
              filledIcon: Icons.home_rounded,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.grid_view_rounded,
              outlinedIcon: Icons.grid_view_outlined,
            ),
          ],
          selectedIndex: 0,
          onItemSelected: (index) {
            // Manejar la selección del ítem
          },
          buttonPadding: 12.0, // Padding para los botones
          backgroundColor: widget.backgroundColorBottomBar,
          waterDropColor: widget.waterDropColorBottomBar,
          iconSize: 30,
          inactiveIconColor:
              widget.waterDropColorBottomBar.withOpacity(0.5), // Color de icono inactivo
        )); /*  */
  }
}

class WaterDropNavBar extends StatelessWidget {
  final List<BarItem> barItems;
  final int selectedIndex;
  final void Function(int) onItemSelected;
  final double?
      buttonPadding; // Agrega el parámetro de padding para los botones
  final Color backgroundColor;
  final Color waterDropColor;
  final double iconSize;
  final Color? inactiveIconColor;

  const WaterDropNavBar({
    required this.barItems,
    required this.selectedIndex,
    required this.onItemSelected,
    this.buttonPadding, // Inicializa el parámetro de padding
    this.backgroundColor = Colors.white,
    this.waterDropColor = const Color(0xFF5B75F0),
    this.iconSize = 28,
    this.inactiveIconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: barItems.map((barItem) {
          final isSelected = barItems.indexOf(barItem) == selectedIndex;
          final color = isSelected
              ? waterDropColor
              : (inactiveIconColor ?? Colors.grey.withOpacity(0.6));
          return Padding(
            padding: EdgeInsets.all(
                buttonPadding ?? 0.0), // Aplica el padding a los botones
            child: GestureDetector(
              onTap: () {
                onItemSelected(barItems.indexOf(barItem));
              },
              child: Icon(
                isSelected ? barItem.filledIcon : barItem.outlinedIcon,
                size: iconSize,
                color: color,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BarItem {
  final IconData filledIcon;
  final IconData outlinedIcon;

  BarItem({
    required this.filledIcon,
    required this.outlinedIcon,
  });
}
