import 'package:flutter/material.dart';
class EarnTheme {
  static const Color black = Color(0xFF0A0A0A);
  static const Color blackCard = Color(0xFF141414);
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF5D76E);
  static const Color goldDark = Color(0xFFB8962E);
  static const Color white = Colors.white;
  static ThemeData get luxury => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    primaryColor: gold,
    appBarTheme: const AppBarTheme(backgroundColor: black, foregroundColor: gold, centerTitle: true),
    colorScheme: const ColorScheme.dark(primary: gold, secondary: goldLight, surface: blackCard),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: gold, foregroundColor: Colors.black, padding: EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
  );
  static BoxDecoration get goldBox => BoxDecoration(color: blackCard, border: Border.all(color: gold.withOpacity(0.6)), borderRadius: BorderRadius.circular(16));
  static BoxDecoration get goldBorder => BoxDecoration(border: Border.all(color: gold), borderRadius: BorderRadius.circular(16));
}
