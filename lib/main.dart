import 'package:awsshop/components/admin/customice_tab/customize_state.dart';
import 'package:awsshop/components/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/app_bar/app_bar.dart';
import 'components/app_bar/drawer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppcustomizeState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: Consumer<AppcustomizeState>(
        builder: (context, appBarState, child) {
          return Scaffold(
            appBar: AwsomeShopAppBar(
              textColor: appBarState.textColor,
              backgroundColor: appBarState.backgroundColor,
              fontSize: appBarState.fontSize,
              text: appBarState.text,
              isAdmin: true,
            ),
            drawer: FullScreenDrawer(
              backgroundColor: appBarState.backgroundColor,
              textColor: appBarState.textColor,
            ),
            body: const LandingView(),
          );
          /* return Scaffold(
            drawer: FullScreenDrawer(
              backgroundColor: appBarState.backgroundColor,
              textColor: appBarState.textColor,
            ),
            body: Stack(
              children: [
                Positioned.fill(
                  child: Landing(),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AwsomeShopAppBar(
                    textColor: appBarState.textColor,
                    backgroundColor: appBarState.backgroundColor,
                    text: appBarState.text,
                    fontSize: appBarState.fontSize,
                    isAdmin: true,
                  ),
                ),
              ],
            ),
          ); */
        },
      ),
    );
  }
}
