import 'package:flutter/material.dart';

class AppTheme {
  static const _fontScale = 1.25;

  static var themeData = ThemeData(
    primarySwatch: Colors.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      elevation: 0,
    ),

    /**
     * See https://m3.material.io/styles/typography/type-scale-tokens
     */
    textTheme: const TextTheme(
      /**
       * ------------------------------------------------------------
       * Display
       * ------------------------------------------------------------
       */
      displayLarge: TextStyle(
        fontSize: 57 * _fontScale,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bookinsanity (Remake)',
      ),
      displayMedium: TextStyle(
        fontSize: 45 * _fontScale,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bookinsanity (Remake)',
      ),
      displaySmall: TextStyle(
        fontSize: 36 * _fontScale,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bookinsanity (Remake)',
      ),

      /**
       * ------------------------------------------------------------
       * Headline
       * ------------------------------------------------------------
       */

      headlineLarge: TextStyle(
        fontSize: 32 * _fontScale,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bookinsanity (Remake)',
      ),
      headlineMedium: TextStyle(
        fontSize: 28 * _fontScale,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bookinsanity (Remake)',
      ),
      headlineSmall: TextStyle(
        fontSize: 24 * _fontScale,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bookinsanity (Remake)',
      ),

      /**
       * ------------------------------------------------------------
       * Title
       * ------------------------------------------------------------
       */

      titleLarge: TextStyle(
        fontSize: 22 * _fontScale,
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        //fontSize: 20,
        fontSize: 16 * _fontScale,
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        //fontSize: 16,
        fontSize: 14 * _fontScale,
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        fontWeight: FontWeight.w700,
      ),

      /**
       * ------------------------------------------------------------
       * Label 
       * ------------------------------------------------------------
       */

      labelLarge: TextStyle(
        //fontSize: 20,
        fontSize: 14 * _fontScale,
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        fontWeight: FontWeight.w500,
        //color: Colors.white,
      ),
      labelMedium: TextStyle(
        //fontSize: 20,
        fontSize: 12 * _fontScale,
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        fontWeight: FontWeight.w500,
        //color: Colors.white,
      ),
      labelSmall: TextStyle(
        //fontSize: 20,
        fontSize: 11 * _fontScale,
        fontFamily: 'Mr Eaves Small Caps (Remake)',
        fontWeight: FontWeight.w500,
        //color: Colors.white,
      ),

      /**
       * ------------------------------------------------------------
       * Body 
       * ------------------------------------------------------------
       */

      bodyLarge: TextStyle(
        fontSize: 16 * _fontScale,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bookinsanity (Remake)',
      ),
      bodyMedium: TextStyle(
        fontSize: 14 * _fontScale,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bookinsanity (Remake)',
      ),
      bodySmall: TextStyle(
        fontSize: 12 * _fontScale,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bookinsanity (Remake)',
      ),
    ),
  );
}
