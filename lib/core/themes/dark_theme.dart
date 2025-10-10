import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  primaryColor: const Color(0xFFA95E2D),
  scaffoldBackgroundColor: const Color(0xFF2F2F2F),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFA95E2D),
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFFA95E2D),
    secondary: const Color(0xFFFF6EC7),
    surface: const Color(0xFF3C5AA6),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(fontWeight: FontWeight.bold),
  ),
);
