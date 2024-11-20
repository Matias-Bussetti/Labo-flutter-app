import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primary = Colors.red;
  static const Color secondary = Colors.grey;
  static final Color primaryHover = Colors.red.shade600;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.amber,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red, foregroundColor: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: primary, foregroundColor: Colors.white)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: secondary, foregroundColor: Colors.white)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(iconColor: primary),
      /* switchTheme: SwitchThemeData(), */
      inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: const TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: primary),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.greenAccent,
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.red, foregroundColor: Colors.white),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),
  );
}
