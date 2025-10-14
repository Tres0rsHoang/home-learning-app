import 'package:donuts_app/core/themes/light_theme.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Baloo2',
  useMaterial3: true,
  primaryColor: const Color(0xFFA95E2D),
  scaffoldBackgroundColor: const Color(0xFF2F2F2F),
  cardColor: const Color(0xFF4E342E),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF3E2723),
    selectedItemColor: Color(0xFFFED90F),
    unselectedItemColor: Color(0xFFFFB6C1),
    selectedIconTheme: IconThemeData(size: 30),
    unselectedIconTheme: IconThemeData(size: 26),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xFFFED90F),
    ),
    unselectedLabelStyle: TextStyle(color: Color(0xFFFFB6C1)),
    type: BottomNavigationBarType.fixed,
    elevation: 10,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.pressed)) return Color(0x3FA95E2D);
        return Color(0xFFA95E2D);
      }),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    ),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: const Color(0xFF2D3E50),
    shape: RoundedRectangleBorder(borderRadius: borderRadius, side: borderSide),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: borderRadius),
    floatingLabelStyle: TextStyle(color: Color(0xFFFED90F)),
    focusedBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(width: 1, color: Color(0xFFF9F7F4)),
    ),
  ),
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
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFED90F),
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFED90F),
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFED90F),
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Color(0xFFF9F7F4),
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Color(0xFFF9F7F4),
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFFF9F7F4),
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFF9E3),
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFF9E3),
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFF9E3),
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFE0E0E0), height: 1.4),
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFE0E0E0), height: 1.5),
    bodySmall: TextStyle(fontSize: 12, color: Color(0xFFE0E0E0), height: 1.4),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFED90F),
      letterSpacing: 0.2,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFED90F),
      letterSpacing: 0.3,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFED90F),
      letterSpacing: 0.4,
    ),
  ),
);
