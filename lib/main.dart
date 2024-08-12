import 'package:awsshop/components/admin/customice_tab/customize_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'components/app_bar/app_bar.dart';
import 'components/app_bar/botom_bar.dart';
import 'components/app_bar/drawer.dart';
import 'components/landing/landing.dart';
import 'components/product_grid/product_grid.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  
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
      home: const HomePage(),
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

  @override
  Widget build(BuildContext context) {
    return Consumer<AppcustomizeState>(
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
          body: selectedIndex == 0 ? const LandingView() : const ProductsGridPage(),
          bottomNavigationBar: BotomBarNavigation(
            selectedIndex: selectedIndex,
            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}
