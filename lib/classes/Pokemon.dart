// To parse this JSON data, do
//
//     final Pokemon = PokemonFromJson(jsonString);

// ignore_for_file: unused_import

import 'dart:convert';

class Pokemon {
  int id;
  String name;
  List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
  });

  static List<Pokemon> listFromJson(Map<String, dynamic> json) {
    return List<Pokemon>.from(
        json['data'].map((patient) => Pokemon.fromJson(patient)));
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        types: List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "types": List<dynamic>.from(types.map((x) => x)),
      };
}
