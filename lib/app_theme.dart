import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._(this.name, this.data);

  final String name;
  final ThemeData data;

  static AppTheme get light => AppTheme._('light', _buildLightTheme());
  static AppTheme get dark => AppTheme._('dark', _buildDarkTheme());

  static ThemeData _buildLightTheme() {
    return ThemeData(
      primarySwatch: Colors.purple,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      primaryTextTheme: _buildPrimaryTextTheme(),
      textTheme: _buildPrimaryTextTheme(),
    );
  }

  static ThemeData _buildDarkTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static TextStyle _heading(
    double fontSize,
    FontWeight fontWeight,
  ) =>
      TextStyle(
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

  static TextStyle _body(
    double fontSize,
    FontWeight fontWeight,
  ) =>
      TextStyle(
        fontFamily: 'Bookinsanity (Remake)',
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

  static TextTheme _buildPrimaryTextTheme() {
    return TextTheme(
      displayLarge: _heading(57, FontWeight.w400),
      displayMedium: _heading(45, FontWeight.w400),
      displaySmall: _heading(36, FontWeight.w400),
      headlineLarge: _heading(32, FontWeight.w400),
      headlineMedium: _heading(28, FontWeight.w400),
      headlineSmall: _heading(24, FontWeight.w400),
      titleLarge: _heading(22, FontWeight.w400),
      titleMedium: _body(16, FontWeight.w500),
      titleSmall: _body(14, FontWeight.w500),
      labelLarge: _body(14, FontWeight.w500),
      labelMedium: _body(12, FontWeight.w500),
      labelSmall: _body(11, FontWeight.w500),
      bodyLarge: _body(16, FontWeight.w400),
      bodyMedium: _body(14, FontWeight.w400),
      bodySmall: _body(12, FontWeight.w400),
    ).apply(
      bodyColor: Colors.black,
    );
  }
}
