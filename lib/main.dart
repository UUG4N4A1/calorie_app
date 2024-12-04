import 'package:calorie_app/Theme/dark_mode.dart';
import 'package:calorie_app/pages/home_page.dart';
import 'package:calorie_app/pages/landing_page.dart';
import 'package:calorie_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'Theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darkMode,
        // darkTheme: darkMode,
        home: LandingPage());
  }
}
