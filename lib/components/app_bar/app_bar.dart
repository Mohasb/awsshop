/* import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class RainbowAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final bool isAdmin;

  const RainbowAppBar({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
    required this.isAdmin,
  });

  @override
  _RainbowAppBarState createState() => _RainbowAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _RainbowAppBarState extends State<RainbowAppBar> {
  Color _currentTextColor = Colors.white;
  Color _currentBackgroundColor = Colors.blue;
  String _currentText = 'My Custom AppBar';

  @override
  void initState() {
    super.initState();
    _currentTextColor = widget.textColor;
    _currentBackgroundColor = widget.backgroundColor;
    _currentText = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 5,
      shadowColor: _currentBackgroundColor,
      title: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 500),
        style: TextStyle(
          fontSize: 30,
          color: _currentTextColor,
          fontWeight: FontWeight.bold,
        ),
        child: Text(_currentText),
      ),
      backgroundColor: _currentBackgroundColor,
      leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Open the drawer
          },
        ),
      actions: [
        const Icon(Icons.account_circle_rounded),
        if (widget.isAdmin) ...[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _showEditDialog(context),
          ),
        ],
      ],
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar AppBar'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Texto AppBar'),
                  controller: TextEditingController(text: _currentText),
                  onChanged: (value) {
                    setState(() {
                      _currentText = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Text("Color de Texto:"),
                    ColorPicker(
                      pickerColor: _currentTextColor,
                      onColorChanged: (color) {
                        setState(() {
                          _currentTextColor = color;
                        });
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
                      pickerColor: _currentTextColor,
                      onColorChanged: (color) {
                        setState(() {
                          _currentTextColor = color;
                        });
                      },
                      labelTypes: const [],
                      pickerAreaHeightPercent: 0.8,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Modificar'),
            ),
          ],
        );
      },
    );
  }
}
 */
import 'package:awsshop/components/config/app_customize_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class RainbowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final bool isAdmin;

  const RainbowAppBar({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 5,
      shadowColor: backgroundColor,
      title: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 500),
        style: TextStyle(
          fontSize: 30,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        child: Text(text),
      ),
      backgroundColor: backgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: textColor,
        onPressed: () {
          Scaffold.of(context).openDrawer(); // Open the drawer
        },
      ),
      actions: [
        IconButton(
          onPressed: () => {}, // TODO
          icon: const Icon(Icons.account_circle_rounded),
          color: textColor,
        ),
        if (isAdmin) ...[
          IconButton(
            icon: const Icon(Icons.edit),
            color: textColor,
            onPressed: () => _showEditDialog(context),
          ),
        ],
      ],
    );
  }

  void _showEditDialog(BuildContext context) {
    final appBarState = Provider.of<AppcustomizeState>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar AppBar'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Texto AppBar'),
                  controller: TextEditingController(text: appBarState.text),
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
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Modificar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
