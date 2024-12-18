import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFFF6F6F6), 
    primary: Color(0xFF88C542), 
    secondary: Color(0xFFFDA085), 
    inversePrimary: Color(0xFF38761D), 
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Color(0xFF4A4A4A), 
        displayColor: Color(0xFF222222), 
      ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF88C542),
    foregroundColor: Colors.white, 
  ),
);
