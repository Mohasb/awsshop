import 'package:awsshop/components/admin/admin_view.dart';
import 'package:awsshop/components/admin/customice_tab/theme/theme_state.dart';
import 'package:awsshop/components/app_bar/app_bar_state.dart';
import 'package:awsshop/components/botom_bar/botom_bar.dart';
import 'package:awsshop/components/botom_bar/bottom_bar_state.dart';
import 'package:awsshop/components/drawer/drawer_state.dart';
import 'package:awsshop/services/utils/check_backend.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'components/app_bar/app_bar.dart';
import 'components/drawer/drawer.dart';
import 'components/landing/landing.dart';
import 'components/product_grid/product_grid.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeState()),
        ProxyProvider<ThemeState, AppBarState>(
          update: (context, themeState, appBarState) => AppBarState(themeState),
        ),
        ProxyProvider<ThemeState, DrawerState>(
          update: (context, themeState, drawerState) => DrawerState(themeState),
        ),
        ProxyProvider<ThemeState, BottomBarState>(
          update: (context, themeState, bottomBarState) => BottomBarState(themeState),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
      builder: (context, themeState, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AppBarState(themeState)),
            ChangeNotifierProvider(create: (context) => DrawerState(themeState)),
            ChangeNotifierProvider(create: (context) => BottomBarState(themeState)),
          ],
          child: MaterialApp(
            title: 'AWSSHOP',
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(
                backgroundColor: themeState.currentThemeMode == ThemeMode.light
                    ? Colors.white
                    : Colors.black,
              ),
              drawerTheme: DrawerThemeData(
                backgroundColor: themeState.currentThemeMode == ThemeMode.light
                    ? Colors.red
                    : Colors.grey[850]!,
              ),
              bottomAppBarTheme: BottomAppBarTheme(
                color: themeState.currentThemeMode == ThemeMode.light
                    ? Colors.red
                    : Colors.black,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
              ),
              drawerTheme: DrawerThemeData(
                backgroundColor: Colors.grey[800]!,
              ),
              bottomAppBarTheme: const BottomAppBarTheme(
                color: Colors.black,
              ),
            ),
            themeMode: themeState.currentThemeMode,
            home: const HomePage(),
          ),
        );
      },
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  Future<void>? _backendFuture;
bool _showAdminView = false;

  @override
  void initState() {
    super.initState();
    _backendFuture = _fetchDataFromBackend();
  }

  Future<void> _fetchDataFromBackend() async {
    await checkBackend();
  }

  void _toggleAdminView() {
    setState(() {
      _showAdminView = !_showAdminView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context), 
      drawer: Consumer<DrawerState>(
        builder: (context, drawerState, child) {
          return FullScreenDrawer(
            backgroundColor: drawerState.backgroundColorDrawer,
            textColor: drawerState.textColorDrawer,
          );
        },
      ),
      body: FutureBuilder<void>(
        future: _backendFuture,
        builder: (context, snapshot) {
          if (_showAdminView) {
            return const AdminView(); 
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animations/error_animation.json'),
                  const SizedBox(height: 20),
                  const Text(
                    'Error al cargar los datos',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ],
              ),
            );
          } else {
            return selectedIndex == 0
                ? const LandingView()
                : const ProductsGridPage();
          }
        },
      ),
      bottomNavigationBar: Consumer<BottomBarState>(
        builder: (context, bottomBarState, child) {
          return BotomBarNavigation(
            selectedIndex: selectedIndex,
            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            backgroundColorBottomBar: bottomBarState.bgColorBottomBar,
            waterDropColorBottomBar: bottomBarState.colorWaterDropBottomBar,
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final appBarState = Provider.of<AppBarState>(context);

    return AwsomeShopAppBar(
      textColor: appBarState.textColor,
      backgroundColor: appBarState.backgroundColor,
      fontSize: appBarState.fontSize,
      text: appBarState.text,
      isAdmin: true,
      onAdminIconPressed: _toggleAdminView,
    );
  }
}
