import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF1E1E1E), // Dark gray for backgrounds
    primary: Color(0xFF66A64F), // Muted green for primary actions
    secondary: Color(0xFFE07A5F), // Muted peach for highlights
    inversePrimary: Color(0xFF264D29), // Deep green for inverse actions
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Color(0xFFDADADA), // Light gray for body text
        displayColor: Color(0xFFFFFFFF), // White for headings
      ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E), // Matches surface color
    foregroundColor: Color(0xFFFFFFFF), // App bar text color
  ),
);
