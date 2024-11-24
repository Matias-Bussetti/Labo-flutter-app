// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

HarryPotterCharacters harrypottercharactersFromJson(String str) => HarryPotterCharacters.fromJson(json.decode(str));

String harrypottercharactersToJson(HarryPotterCharacters data) => json.encode(data.toJson());

class HarryPotterCharacters {
    int status;
    List<Datum> data;
    int requestTime;

    HarryPotterCharacters({
        required this.status,
        required this.data,
        required this.requestTime,
    });

    factory HarryPotterCharacters.fromJson(Map<String, dynamic> json) => HarryPotterCharacters(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        requestTime: json["requestTime"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "requestTime": requestTime,
    };
}

class Datum {
    int id;
    String name;
    Gender gender;
    House house;
    String actor;
    Ancestry ancestry;
    List<String> alternateNames;
    String image;

    Datum({
        required this.id,
        required this.name,
        required this.gender,
        required this.house,
        required this.actor,
        required this.ancestry,
        required this.alternateNames,
        required this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        gender: genderValues.map[json["gender"]]!,
        house: houseValues.map[json["house"]]!,
        actor: json["actor"],
        ancestry: ancestryValues.map[json["ancestry"]]!,
        alternateNames: List<String>.from(json["alternate_names"]?.map((x) => x) ?? []),
        image: json["image"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": genderValues.reverse[gender],
        "house": houseValues.reverse[house],
        "actor": actor,
        "ancestry": ancestryValues.reverse[ancestry],
        "alternate_names": List<dynamic>.from(alternateNames.map((x) => x)),
        "image": image,
    };
}

enum Ancestry {
    EMPTY,
    HALF_BLOOD,
    MUGGLE,
    MUGGLEBORN,
    PURE_BLOOD,
    SQUIB
}

final ancestryValues = EnumValues({
    "": Ancestry.EMPTY,
    "half-blood": Ancestry.HALF_BLOOD,
    "muggle": Ancestry.MUGGLE,
    "muggleborn": Ancestry.MUGGLEBORN,
    "pure-blood": Ancestry.PURE_BLOOD,
    "squib": Ancestry.SQUIB
});

enum Gender {
    EMPTY,
    FEMALE,
    MALE
}

final genderValues = EnumValues({
    "": Gender.EMPTY,
    "female": Gender.FEMALE,
    "male": Gender.MALE
});

enum House {
    EMPTY,
    GRYFFINDOR,
    HUFFLEPUFF,
    RAVENCLAW,
    SLYTHERIN
}

final houseValues = EnumValues({
    "": House.EMPTY,
    "Gryffindor": House.GRYFFINDOR,
    "Hufflepuff": House.HUFFLEPUFF,
    "Ravenclaw": House.RAVENCLAW,
    "Slytherin": House.SLYTHERIN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
