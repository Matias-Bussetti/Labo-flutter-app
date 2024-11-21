import 'dart:convert';

List<HarryPotterCharacters> welcomeFromJson(String str) =>
    List<HarryPotterCharacters>.from(json.decode(str).map((x) => HarryPotterCharacters.fromJson(x)));

String harryPotterCharactersToJson(List<HarryPotterCharacters> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HarryPotterCharacters {
  String id;
  String name;
  List<String> alternateNames;
  String species;
  Gender gender;
  House house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool wizard;
  Ancestry ancestry;
  EyeColour eyeColour;
  HairColour hairColour;
  Wand wand;
  Patronus patronus;
  bool hogwartsStudent;
  bool hogwartsStaff;
  String actor;
  List<String> alternateActors;
  bool alive;
  String image;

  HarryPotterCharacters({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternateActors,
    required this.alive,
    required this.image,
  });

  factory HarryPotterCharacters.fromJson(Map<String, dynamic> json) => HarryPotterCharacters(
    id: json["id"] ?? "", // Usar un valor predeterminado en caso de null
    name: json["name"] ?? "", 
    alternateNames: List<String>.from(json["alternate_names"]?.map((x) => x) ?? []),
    species: json["species"] ?? "",
    gender: genderValues.map[json["gender"]] ?? Gender.EMPTY, // Asegurarse de que sea un valor válido
    house: houseValues.map[json["house"]] ?? House.EMPTY, 
    dateOfBirth: json["dateOfBirth"] ?? "",
    yearOfBirth: json["yearOfBirth"] ?? 0,
    wizard: json["wizard"] ?? false,
    ancestry: ancestryValues.map[json["ancestry"]] ?? Ancestry.EMPTY,
    eyeColour: eyeColourValues.map[json["eyeColour"]] ?? EyeColour.EMPTY,
    hairColour: hairColourValues.map[json["hairColour"]] ?? HairColour.EMPTY,
    wand: json["wand"] != null ? Wand.fromJson(json["wand"]) : Wand(wood: "Unknown", core: "Unknown", length: null),
    patronus: patronusValues.map[json["patronus"]] ?? Patronus.EMPTY,
    hogwartsStudent: json["hogwartsStudent"] ?? false,
    hogwartsStaff: json["hogwartsStaff"] ?? false,
    actor: json["actor"] ?? "",
    alternateActors: List<String>.from(json["alternate_actors"]?.map((x) => x) ?? []),
    alive: json["alive"] ?? false,
    image: json["image"] ?? "",
);


  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternate_names": List<dynamic>.from(alternateNames.map((x) => x)),
        "species": species,
        "gender": genderValues.reverse[gender],
        "house": houseValues.reverse[house],
        "dateOfBirth": dateOfBirth,
        "yearOfBirth": yearOfBirth,
        "wizard": wizard,
        "ancestry": ancestryValues.reverse[ancestry],
        "eyeColour": eyeColourValues.reverse[eyeColour],
        "hairColour": hairColourValues.reverse[hairColour],
        "wand": wand.toJson(),
        "patronus": patronusValues.reverse[patronus],
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alternate_actors": List<dynamic>.from(alternateActors.map((x) => x)),
        "alive": alive,
        "image": image,
      };
}

enum Ancestry { EMPTY, HALF_BLOOD, HALF_VEELA, MUGGLE, MUGGLEBORN, PURE_BLOOD, QUARTER_VEELA, SQUIB }

extension AncestryExtension on Ancestry {
  String get displayName {
    switch (this) {
      case Ancestry.HALF_BLOOD:
        return "Sangre mestiza";
      case Ancestry.HALF_VEELA:
        return "Medio Veela";
      case Ancestry.MUGGLE:
        return "Muggle";
      case Ancestry.MUGGLEBORN:
        return "Nacido de muggles";
      case Ancestry.PURE_BLOOD:
        return "Sangre pura";
      case Ancestry.QUARTER_VEELA:
        return "Un cuarto Veela";
      case Ancestry.SQUIB:
        return "Squib";
      case Ancestry.EMPTY:
      default:
        return "Sin ascendencia";
    }
  }
}

enum EyeColour { EMPTY, BLUE, BROWN, GREEN, GREY, HAZEL, BLACK, YELLOW }

extension EyeColourExtension on EyeColour {
  String get displayName {
    switch (this) {
      case EyeColour.BLUE:
        return "Azul";
      case EyeColour.BROWN:
        return "Marrón";
      case EyeColour.GREEN:
        return "Verde";
      case EyeColour.GREY:
        return "Gris";
      case EyeColour.HAZEL:
        return "Avellana";
      case EyeColour.BLACK:
        return "Negro";
      case EyeColour.YELLOW:
        return "Amarillo";
      case EyeColour.EMPTY:
      default:
        return "Sin color definido";
    }
  }
}

enum HairColour { EMPTY, BLOND, BLACK, BROWN, GREY, RED, WHITE }

extension HairColourExtension on HairColour {
  String get displayName {
    switch (this) {
      case HairColour.BLOND:
        return "Rubio";
      case HairColour.BLACK:
        return "Negro";
      case HairColour.BROWN:
        return "Marrón";
      case HairColour.GREY:
        return "Gris";
      case HairColour.RED:
        return "Rojo";
      case HairColour.WHITE:
        return "Blanco";
      case HairColour.EMPTY:
      default:
        return "Sin color definido";
    }
  }
}

enum Gender { EMPTY, FEMALE, MALE }

extension GenderExtension on Gender {
  String get displayName {
    switch (this) {
      case Gender.FEMALE:
        return "Femenino";
      case Gender.MALE:
        return "Masculino";
      case Gender.EMPTY:
      default:
        return "Sin género";
    }
  }
}

// Sigue el resto de las definiciones previas para Wand, Patronus, etc.
enum Patronus { EMPTY, STAG, OTTER, PHOENIX, WOLF, DOE, HARE }

extension PatronusExtension on Patronus {
  String get displayName {
    switch (this) {
      case Patronus.STAG:
        return "Ciervo";
      case Patronus.OTTER:
        return "Nutria";
      case Patronus.PHOENIX:
        return "Fénix";
      case Patronus.WOLF:
        return "Lobo";
      case Patronus.DOE:
        return "Cierva";
      case Patronus.HARE:
        return "Liebre";
      case Patronus.EMPTY:
      default:
        return "Sin patronus definido";
    }
  }
}

enum House { EMPTY, GRYFFINDOR, HUFFLEPUFF, RAVENCLAW, SLYTHERIN }

extension HouseExtension on House {
  String get displayName {
    switch (this) {
      case House.GRYFFINDOR:
        return "Gryffindor";
      case House.HUFFLEPUFF:
        return "Hufflepuff";
      case House.RAVENCLAW:
        return "Ravenclaw";
      case House.SLYTHERIN:
        return "Slytherin";
      case House.EMPTY:
      default:
        return "Sin casa asignada";
    }
  }
}

class Wand {
  String wood;
  String core;
  double? length;

  Wand({
    required this.wood,
    required this.core,
    required this.length,
  });

  factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: json["wood"] ?? "Desconocida",
        core: json["core"] ?? "Desconocida",
        length: json["length"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "wood": wood,
        "core": core,
        "length": length,
      };
}


// EnumValues sigue igual
class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

final genderValues = EnumValues({
  "male": Gender.MALE,
  "female": Gender.FEMALE,
  "": Gender.EMPTY,
});

final houseValues = EnumValues({
  "Gryffindor": House.GRYFFINDOR,
  "Hufflepuff": House.HUFFLEPUFF,
  "Ravenclaw": House.RAVENCLAW,
  "Slytherin": House.SLYTHERIN,
  "": House.EMPTY,
});

final ancestryValues = EnumValues({
  "half-blood": Ancestry.HALF_BLOOD,
  "half-veela": Ancestry.HALF_VEELA,
  "muggle": Ancestry.MUGGLE,
  "muggleborn": Ancestry.MUGGLEBORN,
  "pure-blood": Ancestry.PURE_BLOOD,
  "quarter-veela": Ancestry.QUARTER_VEELA,
  "squib": Ancestry.SQUIB,
  "": Ancestry.EMPTY,
});

final eyeColourValues = EnumValues({
  "blue": EyeColour.BLUE,
  "brown": EyeColour.BROWN,
  "green": EyeColour.GREEN,
  "grey": EyeColour.GREY,
  "hazel": EyeColour.HAZEL,
  "black": EyeColour.BLACK,
  "yellow": EyeColour.YELLOW,
  "": EyeColour.EMPTY,
});

final hairColourValues = EnumValues({
  "blond": HairColour.BLOND,
  "black": HairColour.BLACK,
  "brown": HairColour.BROWN,
  "grey": HairColour.GREY,
  "red": HairColour.RED,
  "white": HairColour.WHITE,
  "": HairColour.EMPTY,
});

final patronusValues = EnumValues({
  "stag": Patronus.STAG,
  "otter": Patronus.OTTER,
  "phoenix": Patronus.PHOENIX,
  "wolf": Patronus.WOLF,
  "doe": Patronus.DOE,
  "hare": Patronus.HARE,
  "": Patronus.EMPTY,
});