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
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
      listTileTheme: ListTileThemeData(iconColor: primary),
      /* switchTheme: SwitchThemeData(), */
      inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primary),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.greenAccent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.purple[900], foregroundColor: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.purple[900],
      foregroundColor: Colors.white,
    ),
  );
}
