import 'package:flutter/material.dart';
import 'package:store_app_postman/UiPart/screens/HomeScreen.dart';
import 'package:store_app_postman/UiPart/screens/WelcomeScreen.dart';
import 'package:store_app_postman/UiPart/screens/updateProductScreen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.welcomeScreenRoute,
      routes: {
        WelcomeScreen.welcomeScreenRoute: (context) => WelcomeScreen(),
        HomeScreen.homeScreenRoute: (context) => HomeScreen(),
        UpdateProductScreen.updateProductScreenRoute: (context) =>
            const UpdateProductScreen(),
      },
    );
  }
}
