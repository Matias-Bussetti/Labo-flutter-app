import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

class DefaultTheme {
  static const Color primary = Colors.red;
  static const Color secondary = Colors.grey;
  static final Color primaryHover = Colors.red.shade600;

  // Colores por casa
  static final Map<House, List<Color>> houseColors = {
    House.GRYFFINDOR: [Colors.red, Colors.yellow],
    House.SLYTHERIN: [Colors.green, Colors.grey],
    House.HUFFLEPUFF: [Colors.yellow, Colors.black],
    House.RAVENCLAW: [Colors.blue, Colors.brown],
  };

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
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red, foregroundColor: Colors.white),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true, // Para habilitar el color de fondo
      fillColor: Colors.black87, // Color de fondo
      iconColor: Colors.grey, // Color del ícono
      labelStyle: const TextStyle(color: Colors.grey), // Color del texto del label
      hintStyle: const TextStyle(color: Colors.grey), // Color del hint text
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0), // Borde redondeado
        borderSide: const BorderSide(color: Colors.blue), // Color del borde
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide:
            const BorderSide(color: Colors.grey), // Borde cuando está habilitado
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide:
            const BorderSide(color: Colors.blue, width: 2.0), // Borde al enfocar
      ),
    ),
  );
}
