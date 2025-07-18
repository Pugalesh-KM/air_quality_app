import 'package:air_quality_app/shared/config/dimens.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color _colorSeed = Colors.lightBlue;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: _colorSeed,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: _colorSeed,
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    textTheme: _textTheme(Brightness.light),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorSeed,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.standard_10),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimens.standard_8)),
      filled: true,
      fillColor: Colors.grey[100],
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: _colorSeed,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: _colorSeed,
      foregroundColor: Colors.black,
      elevation: 1,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: _textTheme(Brightness.dark),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorSeed,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.standard_10),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimens.standard_8)),
      filled: true,
      fillColor: Colors.grey[850],
    ),
  );

  static TextTheme _textTheme(Brightness brightness) {
    return brightness == Brightness.light
        ? const TextTheme(
      titleLarge: TextStyle(fontSize: Dimens.standard_20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: Dimens.standard_16),
      bodySmall: TextStyle(fontSize: Dimens.standard_14),
    )
        : const TextTheme(
      titleLarge: TextStyle(fontSize: Dimens.standard_20, fontWeight: FontWeight.bold, color: Colors.white),
      bodyMedium: TextStyle(fontSize: Dimens.standard_16, color: Colors.white70),
      bodySmall: TextStyle(fontSize: Dimens.standard_14, color: Colors.white60),
    );
  }
}
