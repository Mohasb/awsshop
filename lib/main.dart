import 'package:awsshop/components/config/app_customize_state.dart';
import 'package:awsshop/components/product_grid/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/app_bar/app_bar.dart';
import 'components/app_bar/drawer.dart';
import 'components/landing/landing.dart';

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
            appBar: RainbowAppBar(
              textColor: appBarState.textColor,
              backgroundColor: appBarState.backgroundColor,
              text: appBarState.text,
              isAdmin: true,
            ),
            drawer: FullScreenDrawer(
              backgroundColor: appBarState.backgroundColor,
              textColor: appBarState.textColor,
            ),
            body: const ProductGrid(),
          );
        },
      ),
    );
  }
}
