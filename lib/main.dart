import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_firebase/provider/dark_theme_provider.dart';
import 'package:shop_firebase/screens/bottom_bar.dart';
import 'package:shop_firebase/screens/cart.dart';
import 'package:shop_firebase/screens/feeds.dart';

import 'const/theme_data.dart';
import 'inner_screens/brands_navigation_rail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
            routes: {
              //   '/': (ctx) => LandingPage(),
              BrandNavigationRailScreen.routeName: (ctx) =>
                  BrandNavigationRailScreen(),
              Feeds.routeName: (ctx) => Feeds(),
              CartScreen.routeName: (ctx) => CartScreen(),
            },
          );
        }));
  }
}
