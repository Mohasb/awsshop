import 'package:awsshop/components/app_bar/app_bar_state.dart';
import 'package:awsshop/components/botom_bar/botom_bar_customization.dart';
import 'package:awsshop/components/botom_bar/bottom_bar_state.dart';
import 'package:awsshop/components/drawer/drawer_customization.dart';
import 'package:awsshop/components/app_bar/nav_constumization.dart';
import 'package:awsshop/components/drawer/drawer_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomiceTab extends StatefulWidget {
  const CustomiceTab({super.key});

  @override
  CustomiceTabState createState() => CustomiceTabState();
}

class CustomiceTabState extends State<CustomiceTab> {
  late TextEditingController textController;
  late TextEditingController fontSizeController;

  // Nav
  Color? _textColor;
  Color? _backgroundColor;
  String? _text;
  double? _fontSize;
  // Drawer
  Color? _textColorDrawer;
  Color? _backgroundColorDrawer;
  // BotomBAr
  Color? _waterDropColor;
  Color? _backgroundColorBotomBar;

  @override
  void initState() {
    super.initState();
    final appBarState = Provider.of<AppBarState>(context, listen: false);
    final botomBarState = Provider.of<BottomBarState>(context, listen: false);
    final drawerState = Provider.of<DrawerState>(context, listen: false);

    // Variables Nav
    textController = TextEditingController(text: appBarState.text);
    fontSizeController =
        TextEditingController(text: appBarState.fontSize.toString());
    _textColor = appBarState.textColor;
    _backgroundColor = appBarState.backgroundColor;
    _text = appBarState.text;
    _fontSize = appBarState.fontSize;

    // Variables Drawer
    _backgroundColorDrawer = drawerState.backgroundColorDrawer;
    _textColorDrawer = drawerState.textColorDrawer;

    // Variables BotomBar
    _waterDropColor = botomBarState.colorWaterDropBottomBar;
    _backgroundColorBotomBar = botomBarState.bgColorBottomBar;

  }

  @override
  void dispose() {
    textController.dispose();
    fontSizeController.dispose();
    super.dispose();
  }

  void _saveChangesNav() {
    final appBarState = Provider.of<AppBarState>(context, listen: false);
    if (_text != null) appBarState.updateNavText(_text!);
    if (_textColor != null) appBarState.updateNavTextColor(_textColor!);
    if (_backgroundColor != null) {
      appBarState.updateNavBackgroundColor(_backgroundColor!);
    }
    if (_fontSize != null) appBarState.updateNavFontSize(_fontSize!);
    Navigator.of(context).pop();
  }

  void _saveChangesDrawer() {
    final drawerState = Provider.of<DrawerState>(context, listen: false);
    if (_textColorDrawer != null) {
      drawerState.updateDrawerTextColor(_textColorDrawer!);
    }
    if (_backgroundColorDrawer != null) {
      drawerState.updateDrawerBackgroundColor(_backgroundColorDrawer!);
    }
    Navigator.of(context).pop();
  }

  void _saveChangesBotomBar() {
    final botomBarState = Provider.of<BottomBarState>(context, listen: false);

    if (_waterDropColor != null) {
      botomBarState.updatecolorWaterDropBottomBar(_waterDropColor!);
    }
    if (_backgroundColorBotomBar != null) {
      botomBarState.updateBgColorBottomBar(_backgroundColorBotomBar!);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fondo del contenedor
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text(
                      'Personalización del Navbar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    initiallyExpanded: false,
                    iconColor:
                        Colors.blueAccent, // Color del ícono de expansión
                    collapsedIconColor: Colors
                        .blueAccent, // Color del ícono de expansión cuando está colapsado
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: NavbarCustomization(
                          textController: textController,
                          fontSizeController: fontSizeController,
                          initialTextColor: _textColor!,
                          initialBackgroundColor: _backgroundColor!,
                          initialText: _text!,
                          initialFontSize: _fontSize!,
                          onTextChange: (text) => _text = text,
                          onTextColorChange: (color) => _textColor = color,
                          onBackgroundColorChange: (color) =>
                              _backgroundColor = color,
                          onFontSizeChange: (size) => _fontSize = size,
                          onSave: _saveChangesNav,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fondo del contenedor
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text(
                      'Personalización del Drawer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    initiallyExpanded: false,
                    iconColor: Colors.blueAccent,
                    collapsedIconColor: Colors.blueAccent,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DrawerCustomization(
                          onTextColorChange: (color) =>
                              _textColorDrawer = color,
                          onBackgroundColorChange: (color) =>
                              _backgroundColorDrawer = color,
                          backgroundColor: _backgroundColorDrawer!,
                          textColor: _textColorDrawer!,
                          onSave: _saveChangesDrawer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ////////////////////////////BOTOMBAR////////////////////////////////////////////////////////
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fondo del contenedor
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text(
                      'Personalización del BotomBar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    initiallyExpanded: false,
                    iconColor: Colors.blueAccent,
                    collapsedIconColor: Colors.blueAccent,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: BotomBarCustomization(
                          onWaterDropColor: (color) =>
                              _waterDropColor = color,
                          onBackgroundColorChange: (color) =>
                              _backgroundColorBotomBar = color,
                          backgroundColor: _backgroundColorBotomBar!,
                          waterDropColor: _waterDropColor!,
                          onSave: _saveChangesBotomBar,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
