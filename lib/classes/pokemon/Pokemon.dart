import 'dart:convert';

PokemonList pokemonListFromJson(String str) =>
    PokemonList.fromJson(json.decode(str));

String pokemonListToJson(PokemonList data) => json.encode(data.toJson());

class PokemonList {
  int status;
  List<Pokemon> data;
  int requestTime;

  PokemonList({
    required this.status,
    required this.data,
    required this.requestTime,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        status: json["status"],
        data: List<Pokemon>.from(json["data"].map((x) => Pokemon.fromJson(x))),
        requestTime: json["requestTime"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "requestTime": requestTime,
      };
}

class Pokemon {
  int id;
  String name;
  List<String> types;
  String image;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.image,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"], // Establece un ID predeterminado si es nulo
        name: json["name"],
        types: List<String>.from(json["types"]?.map((x) => x) ?? []),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "types": List<dynamic>.from(types.map((x) => x)),
        "image": image,
      };

  // Método estático para convertir una lista de JSON a objetos Pokémon
  static List<Pokemon> listFromJson(Map<String, dynamic> json) {
    return List<Pokemon>.from(
        json['data'].map((pokemon) => Pokemon.fromJson(pokemon)));
  }
}
