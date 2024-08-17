import 'package:flutter/material.dart';
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
    return WaterDropNavBar(
      backgroundColor: widget.backgroundColorBottomBar,
      waterDropColor: widget.waterDropColorBottomBar,
      onItemSelected: widget.onItemSelected,
      selectedIndex: widget.selectedIndex,
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
    );
  }
}
