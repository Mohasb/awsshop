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
          systemNavigationBarColor: widget.backgroundColorBottomBar,
          systemNavigationBarDividerColor: widget.waterDropColorBottomBar,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: true,
          statusBarColor: Colors.red,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
        ),
        child: WaterDropNavBar(
          bottomPadding: 20,
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
          selectedIndex: widget.selectedIndex,
          onItemSelected: widget.onItemSelected,
          backgroundColor: widget.backgroundColorBottomBar,
          waterDropColor: widget.waterDropColorBottomBar,
          iconSize: 35,
          inactiveIconColor: widget.waterDropColorBottomBar.withOpacity(0.5),
        ));
  }
}
