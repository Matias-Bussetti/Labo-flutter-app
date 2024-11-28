import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

List<Color> getHouseColors(House? house) {
  if (house == null || house == House.EMPTY) {
    // Colores por defecto si no tiene casa
    return [Colors.grey[700]!, Colors.grey[400]!];
  }
  switch (house) {
    case House.GRYFFINDOR:
      return [Colors.red, Colors.amber];
    case House.SLYTHERIN:
      return [Colors.green, Colors.grey];
    case House.HUFFLEPUFF:
      return [Colors.yellow, Colors.black];
    case House.RAVENCLAW:
      return [Colors.blue, Colors.brown];
    default:
      return [Colors.grey[700]!, Colors.grey[400]!];
  }
}
