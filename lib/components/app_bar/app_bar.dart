import 'package:flutter/material.dart';

class AwsomeShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final double fontSize;
  final bool isAdmin;
  final VoidCallback onAdminIconPressed;

  const AwsomeShopAppBar({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
    required this.fontSize,
    required this.isAdmin,
    required this.onAdminIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      //elevation: 5,
      //shadowColor: backgroundColor,
      title: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 500),
        style: TextStyle(
          fontSize: fontSize,
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
          onPressed: () => {}, 
          icon: const Icon(Icons.account_circle_rounded),
          color: textColor,
        ),
        if (isAdmin) ...[
          IconButton(
            icon: const Icon(Icons.edit),
            color: textColor,
            onPressed: onAdminIconPressed
          ),
        ],
      ],
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
