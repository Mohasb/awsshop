import 'package:awsshop/components/admin/customice_tab/theme/save_theme_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awsshop/components/admin/customice_tab/theme/theme_selection.dart';
import 'package:awsshop/components/app_bar/app_bar_state.dart';
import 'package:awsshop/components/botom_bar/botom_bar_customization.dart';
import 'package:awsshop/components/botom_bar/bottom_bar_state.dart';
import 'package:awsshop/components/drawer/drawer_customization.dart';
import 'package:awsshop/components/app_bar/nav_constumization.dart';
import 'package:awsshop/components/drawer/drawer_state.dart';

import 'theme/app_theme_default.dart';
import 'theme/theme_state.dart';

class CustomiceTab extends StatefulWidget {
  const CustomiceTab({super.key});

  @override
  CustomiceTabState createState() => CustomiceTabState();
}

class CustomiceTabState extends State<CustomiceTab>
    with SingleTickerProviderStateMixin {
  late TextEditingController textController;
  late TextEditingController fontSizeController;

  // Variables de personalización
  Color? _textColor;
  Color? _backgroundColor;
  String? _text;
  double? _fontSize;
  Color? _textColorDrawer;
  Color? _backgroundColorDrawer;
  Color? _waterDropColor;
  Color? _backgroundColorBotomBar;
  Color? _iconColor;

  late final ExpansionTileController _navController;
  late final ExpansionTileController _drawerController;
  late final ExpansionTileController _bottomBarController;

  @override
  void initState() {
    super.initState();
    final appBarState = Provider.of<AppBarState>(context, listen: false);
    final botomBarState = Provider.of<BottomBarState>(context, listen: false);
    final drawerState = Provider.of<DrawerState>(context, listen: false);

    // Inicialización de variables
    textController = TextEditingController(text: appBarState.text);
    fontSizeController = TextEditingController(text: appBarState.fontSize.toString());
    _textColor = appBarState.textColor;
    _backgroundColor = appBarState.backgroundColor;
    _text = appBarState.text;
    _fontSize = appBarState.fontSize;
    _iconColor = appBarState.iconsColor;

    _textColorDrawer = drawerState.textColorDrawer;
    _backgroundColorDrawer = drawerState.backgroundColorDrawer;

    _waterDropColor = botomBarState.colorWaterDropBottomBar;
    _backgroundColorBotomBar = botomBarState.bgColorBottomBar;

    // Controladores de expansión
    _navController = ExpansionTileController();
    _drawerController = ExpansionTileController();
    _bottomBarController = ExpansionTileController();
  }

  @override
  void dispose() {
    textController.dispose();
    fontSizeController.dispose();
    super.dispose();
  }

  void _updateNavChanges() {
    final appBarState = Provider.of<AppBarState>(context, listen: false);
    if (_text != null) appBarState.updateNavText(_text!);
    if (_textColor != null) appBarState.updateNavTextColor(_textColor!);
    if (_backgroundColor != null) {
      appBarState.updateNavBackgroundColor(_backgroundColor!);
    }
    if (_fontSize != null) appBarState.updateNavFontSize(_fontSize!);
    if (_iconColor != null) appBarState.updateNavIconColor(_iconColor!);
  }

  void _updateDrawerChanges() {
    final drawerState = Provider.of<DrawerState>(context, listen: false);
    if (_textColorDrawer != null) {
      drawerState.updateDrawerTextColor(_textColorDrawer!);
    }
    if (_backgroundColorDrawer != null) {
      drawerState.updateDrawerBackgroundColor(_backgroundColorDrawer!);
    }
  }

  void _updateBotomBarChanges() {
    final botomBarState = Provider.of<BottomBarState>(context, listen: false);
    if (_waterDropColor != null) {
      botomBarState.updatecolorWaterDropBottomBar(_waterDropColor!);
    }
    if (_backgroundColorBotomBar != null) {
      botomBarState.updateBgColorBottomBar(_backgroundColorBotomBar!);
    }
  }

  void _handleSaveAndClose(ExpansionTileController controller) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.collapse();
    });
  }

  void _saveCurrentThemeAsNew() {
    final themeToSave = {
      'appBarTextColor': _textColor,
      'appBarIconColor': _iconColor,
      'appBarFontSize': _fontSize,
      'appBarBackgroundColor': _backgroundColor,
      'appBarText': _text,
      'drawerTextColor': _textColorDrawer,
      'drawerBackgroundColor': _backgroundColorDrawer,
      'bottomBarBgColor': _backgroundColorBotomBar,
      'bottomBarWaterDropColor': _waterDropColor,
    };

    showDialog(
      context: context,
      builder: (context) => SaveThemeDialog(themeToSave: themeToSave),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final theme = themeState.currentThemeMode == ThemeMode.light
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;

    final Color textColor = theme['appBarTextColor'] as Color;
    final Color backgroundColor = theme['appBarBackgroundColor'] as Color;
    final Color borderColor = theme['bottomBarWaterDropColor'] as Color;
    final Color boxShadowColor = backgroundColor.withOpacity(0.5);
    final Color expansionTileIconColor = textColor.withOpacity(0.8);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildCustomExpansionTile(
              context,
              'Personalización del Navbar',
              NavbarCustomization(
                textController: textController,
                fontSizeController: fontSizeController,
                initialTextColor: _textColor!,
                initialBackgroundColor: _backgroundColor!,
                initialText: _text!,
                initialFontSize: _fontSize!,
                initialIconsColor: _iconColor!,
                onTextChange: (text) => setState(() {
                  _text = text;
                  _updateNavChanges();
                }),
                onTextColorChange: (color) => setState(() {
                  _textColor = color;
                  _updateNavChanges();
                }),
                onBackgroundColorChange: (color) => setState(() {
                  _backgroundColor = color;
                  _updateNavChanges();
                }),
                onFontSizeChange: (size) => setState(() {
                  _fontSize = size;
                  _updateNavChanges();
                }),
                onIconsColorChange: (Color color) { 
                  _iconColor = color;
                  _updateNavChanges();
                 },
                onSave: () => _handleSaveAndClose(_navController), 
              ),
              _navController,
              textColor,
              backgroundColor,
              borderColor,
              boxShadowColor,
              expansionTileIconColor,
            ),
            const SizedBox(height: 20),
            _buildCustomExpansionTile(
              context,
              'Personalización del Drawer',
              DrawerCustomization(
                onTextColorChange: (color) => setState(() {
                  _textColorDrawer = color;
                  _updateDrawerChanges();
                }),
                onBackgroundColorChange: (color) => setState(() {
                  _backgroundColorDrawer = color;
                  _updateDrawerChanges();
                }),
                backgroundColor: _backgroundColorDrawer!,
                textColor: _textColorDrawer!,
                onSave: () => _handleSaveAndClose(_drawerController),
              ),
              _drawerController,
              textColor,
              backgroundColor,
              borderColor,
              boxShadowColor,
              expansionTileIconColor,
            ),
            const SizedBox(height: 20),
            _buildCustomExpansionTile(
              context,
              'Personalización del BottomBar',
              BotomBarCustomization(
                onWaterDropColor: (color) => setState(() {
                  _waterDropColor = color;
                  _updateBotomBarChanges();
                }),
                onBackgroundColorChange: (color) => setState(() {
                  _backgroundColorBotomBar = color;
                  _updateBotomBarChanges();
                }),
                backgroundColor: _backgroundColorBotomBar!,
                waterDropColor: _waterDropColor!,
                onSave: () => _handleSaveAndClose(_bottomBarController),
              ),
              _bottomBarController,
              textColor,
              backgroundColor,
              borderColor,
              boxShadowColor,
              expansionTileIconColor,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveCurrentThemeAsNew,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: textColor,
                shadowColor: boxShadowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: borderColor,
                    width: 2,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: Text(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: textColor),
                  'Guardar Tema Actual'),
            ),
            const SizedBox(height: 20),
            const ThemeSelection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomExpansionTile(
    BuildContext context,
    String title,
    Widget child,
    ExpansionTileController controller,
    Color textColor,
    Color backgroundColor,
    Color borderColor,
    Color boxShadowColor,
    Color iconColor,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: boxShadowColor,
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ExpansionTile(
          controller: controller,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          iconColor: iconColor,
          collapsedIconColor: iconColor,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  textTheme: TextTheme(
                    bodyMedium: TextStyle(color: textColor),
                  ),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: textColor,
                    secondary: backgroundColor,
                  ),
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}