import 'package:awsshop/components/drawer/drawer_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullScreenDrawer extends StatelessWidget {
  const FullScreenDrawer({super.key, required Color backgroundColor, required Color textColor});

  @override
  Widget build(BuildContext context) {
    final drawerState = Provider.of<DrawerState>(context);

    return Drawer(
      child: Container(
        color: drawerState.backgroundColorDrawer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Drawer',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: drawerState.textColorDrawer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
