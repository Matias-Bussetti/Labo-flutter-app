class Pokemon {
  int id;
  String name;
  List<String> types;
  String image;
  Stats stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.image,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        types: List<String>.from(json["types"].map((x) => x)),
        image: json["image"],
        stats: Stats.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "types": List<dynamic>.from(types.map((x) => x)),
        "image": image,
        "stats": stats.toJson(), 
      };

  static List<Pokemon> listFromJson(List<dynamic> jsonList) {
    return List<Pokemon>.from(jsonList.map((pokemon) => Pokemon.fromJson(pokemon)));
  }
}

class Stats {
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;

  Stats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        hp: json["hp"],
        attack: json["attack"],
        defense: json["defense"],
        specialAttack: json["specialAttack"],
        specialDefense: json["specialDefense"],
        speed: json["speed"],
      );

  Map<String, dynamic> toJson() => {
        "hp": hp,
        "attack": attack,
        "defense": defense,
        "specialAttack": specialAttack,
        "specialDefense": specialDefense,
        "speed": speed,
      };
}
