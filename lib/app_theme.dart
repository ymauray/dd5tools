import 'package:flutter/material.dart';

class AppTheme {
  static var themeData = ThemeData(
    primarySwatch: Colors.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      color: Colors.red,
      elevation: 0,
      titleTextStyle: const TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Mr Eaves Small Caps (Remake)',
        ),
      ).headline6,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Bookinsanity (Remake)',
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 25,
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
