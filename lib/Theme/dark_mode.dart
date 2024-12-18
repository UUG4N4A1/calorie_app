import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF1E1E1E), 
    primary: Color(0xFF66A64F), 
    secondary: Color(0xFFE07A5F), 
    inversePrimary: Color(0xFF264D29), 
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Color(0xFFDADADA), 
        displayColor: Color(0xFFFFFFFF), 
      ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E), 
    foregroundColor: Color(0xFFFFFFFF), 
  ),
);
