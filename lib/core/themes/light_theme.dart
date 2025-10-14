import 'package:flutter/material.dart';

final borderRadius = BorderRadius.circular(12);
final BorderSide borderSide = BorderSide(
  color: Colors.black,
  width: 2,
  style: BorderStyle.solid,
);
final Border border = Border(
  top: borderSide,
  left: borderSide,
  right: borderSide,
  bottom: borderSide,
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Baloo2',
  useMaterial3: true,
  primaryColor: const Color(0xFFFED90F),
  scaffoldBackgroundColor: const Color(0xFF77D1F6),
  cardColor: const Color(0xFFFFF9E3),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFED90F),
    selectedItemColor: Color(0xFFFF6EC7),
    unselectedItemColor: Color(0xFF2F2F2F),
    selectedIconTheme: IconThemeData(size: 30),
    unselectedIconTheme: IconThemeData(size: 26),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xFFFF6EC7),
    ),
    unselectedLabelStyle: TextStyle(color: Color(0xFF2F2F2F)),
    type: BottomNavigationBarType.fixed,
    elevation: 12,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.pressed)) return Color(0x3FFED90F);
        return Color(0xFFFED90F);
      }),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    ),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: const Color(0xFFFFE3EC),
    shape: RoundedRectangleBorder(borderRadius: borderRadius, side: borderSide),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: borderRadius),
    floatingLabelStyle: TextStyle(color: Color(0xFF2F2F2F)),
    focusedBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(width: 1, color: Colors.black),
    ),
  ),
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
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: Color(0xFF2F2F2F),
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: Color(0xFF2F2F2F),
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Color(0xFF2F2F2F),
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Color(0xFF2F2F2F),
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2F2F2F),
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2F2F2F),
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color(0xFF2F2F2F),
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2F2F2F),
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2F2F2F),
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF2F2F2F), height: 1.4),
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF2F2F2F), height: 1.5),
    bodySmall: TextStyle(fontSize: 12, color: Color(0xFF2F2F2F), height: 1.4),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2F2F2F),
      letterSpacing: 0.2,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2F2F2F),
      letterSpacing: 0.3,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2F2F2F),
      letterSpacing: 0.4,
    ),
  ),
);
