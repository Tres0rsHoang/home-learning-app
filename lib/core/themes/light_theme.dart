import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  primaryColor: const Color(0xFFFED90F),
  scaffoldBackgroundColor: const Color(0xFF77D1F6),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFED90F),
    foregroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFFFED90F),
    secondary: const Color(0xFFFF6EC7),
    surface: const Color(0xFFF9F7F4),
    onPrimary: Colors.black,
    onSecondary: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF2F2F2F)),
    bodyMedium: TextStyle(color: Color(0xFF2F2F2F)),
    titleLarge: TextStyle(fontWeight: FontWeight.bold),
  ),
);
