import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFFF6F6F6), // Soft beige for backgrounds
    primary: Color(0xFF88C542), // Vibrant green for primary actions
    secondary: Color(0xFFFDA085), // Soft peach for highlights
    inversePrimary: Color(0xFF38761D), // Forest green for inverse actions
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Color(0xFF4A4A4A), // Dark gray for text
        displayColor: Color(0xFF222222), // Near-black for headings
      ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF88C542),
    foregroundColor: Colors.white, // App bar text color
  ),
);
