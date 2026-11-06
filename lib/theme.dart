import 'package:flutter/material.dart';
class EarnTheme {
  static const Color black = Color(0xFF0A0A0A);
  static const Color blackCard = Color(0xFF1A1A1A);
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF5D76E);
  static ThemeData get luxury => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    primaryColor: gold,
    appBarTheme: const AppBarTheme(backgroundColor: black, foregroundColor: gold),
    colorScheme: const ColorScheme.dark(primary: gold, secondary: goldLight, surface: blackCard),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: gold, foregroundColor: Colors.black)),
  );
}
