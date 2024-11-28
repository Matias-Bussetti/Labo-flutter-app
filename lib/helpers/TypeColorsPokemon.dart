import 'package:flutter/material.dart';

Color TypeColorPokemon(String? type) {
  if (type == null) {
    return Colors.grey[700]!; // Color por defecto si no tiene tipo
  }

  switch (type.toLowerCase()) {
    case 'fire':
      return const Color.fromARGB(255, 248, 94, 83);
    case 'water':
      return Colors.blue;
    case 'grass':
      return Colors.green;
    case 'electric':
      return Colors.yellow;
    case 'bug':
      return const Color.fromARGB(255, 83, 145, 85);
    case 'normal':
      return const Color.fromARGB(255, 148, 148, 148);
    case 'flying':
      return const Color.fromARGB(255, 94, 149, 194);
    case 'psychic':
      return const Color.fromARGB(255, 190, 71, 211);
    case 'fairy':
      return const Color.fromARGB(255, 238, 151, 180);
    case 'dark':
      return const Color.fromARGB(255, 153, 147, 142);
    case 'dragon':
      return const Color.fromARGB(255, 136, 85, 223);
    case 'ghost':
      return const Color.fromARGB(255, 99, 76, 182);
    case 'steel':
      return Colors.grey;
    case 'ice':
      return Colors.cyan;
    case 'fighting':
      return const Color.fromARGB(255, 177, 129, 98);
    case 'poison':
      return const Color.fromARGB(255, 136, 44, 255);
    case 'ground':
      return const Color.fromARGB(255, 182, 131, 112);
    case 'rock':
      return Colors.brown;
    default:
      return Colors.grey[700]!; // Color por defecto
  }
}
