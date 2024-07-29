import 'package:awsshop/config/app_customize_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullScreenDrawer extends StatelessWidget {
  const FullScreenDrawer({super.key, required Color backgroundColor, required Color textColor});

  @override
  Widget build(BuildContext context) {
    final appBarState = Provider.of<AppcustomizeState>(context);

    return Drawer(
      child: Container(
        color: appBarState.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Full Screen Drawer',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: appBarState.textColor,
              ),
            ),
            // Add more content here
          ],
        ),
      ),
    );
  }
}
