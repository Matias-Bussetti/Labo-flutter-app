// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<HarryPotterCharacters> welcomeFromJson(String str) => List<HarryPotterCharacters>.from(json.decode(str).map((x) => HarryPotterCharacters.fromJson(x)));

String harryPotterCharactersToJson(List<HarryPotterCharacters> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
        id: json["id"],
        name: json["name"],
        alternateNames: List<String>.from(json["alternate_names"].map((x) => x)),
        species: json["species"],
        gender: genderValues.map[json["gender"]]!,
        house: houseValues.map[json["house"]]!,
        dateOfBirth: json["dateOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        wizard: json["wizard"],
        ancestry: ancestryValues.map[json["ancestry"]]!,
        eyeColour: eyeColourValues.map[json["eyeColour"]]!,
        hairColour: hairColourValues.map[json["hairColour"]]!,
        wand: Wand.fromJson(json["wand"]),
        patronus: patronusValues.map[json["patronus"]]!,
        hogwartsStudent: json["hogwartsStudent"],
        hogwartsStaff: json["hogwartsStaff"],
        actor: json["actor"],
        alternateActors: List<String>.from(json["alternate_actors"].map((x) => x)),
        alive: json["alive"],
        image: json["image"],
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

enum Ancestry {
    empty,
    half_blood,
    half_veela,
    muggle,
    muggleborn,
    pure_blood,
    quarter_veela,
    squib
}

final ancestryValues = EnumValues({
    "": Ancestry.empty,
    "half-blood": Ancestry.half_blood,
    "half-veela": Ancestry.half_veela,
    "muggle": Ancestry.muggle,
    "muggleborn": Ancestry.muggleborn,
    "pure-blood": Ancestry.pure_blood,
    "quarter-veela": Ancestry.quarter_veela,
    "squib": Ancestry.squib
});

enum EyeColour {
    AMBER,
    BEADY,
    BLACK,
    BLUE,
    BROWN,
    DARK,
    EMPTY,
    GREEN,
    GREY,
    HAZEL,
    ORANGE,
    PALE_SILVERY,
    SCARLET,
    SILVER,
    WHITE,
    YELLOW,
    YELLOWISH
}

final eyeColourValues = EnumValues({
    "amber": EyeColour.AMBER,
    "beady": EyeColour.BEADY,
    "black": EyeColour.BLACK,
    "blue": EyeColour.BLUE,
    "brown": EyeColour.BROWN,
    "dark": EyeColour.DARK,
    "": EyeColour.EMPTY,
    "green": EyeColour.GREEN,
    "grey": EyeColour.GREY,
    "hazel": EyeColour.HAZEL,
    "orange": EyeColour.ORANGE,
    "pale, silvery": EyeColour.PALE_SILVERY,
    "Scarlet": EyeColour.SCARLET,
    "silver": EyeColour.SILVER,
    "white": EyeColour.WHITE,
    "yellow": EyeColour.YELLOW,
    "yellowish": EyeColour.YELLOWISH
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

enum HairColour {
    BALD,
    BLACK,
    BLOND,
    BLONDE,
    BROWN,
    DARK,
    DULL,
    EMPTY,
    GINGER,
    GREEN,
    GREY,
    PURPLE,
    RED,
    SANDY,
    SILVER,
    TAWNY,
    WHITE
}

final hairColourValues = EnumValues({
    "bald": HairColour.BALD,
    "black": HairColour.BLACK,
    "blond": HairColour.BLOND,
    "blonde": HairColour.BLONDE,
    "brown": HairColour.BROWN,
    "dark": HairColour.DARK,
    "dull": HairColour.DULL,
    "": HairColour.EMPTY,
    "ginger": HairColour.GINGER,
    "green": HairColour.GREEN,
    "grey": HairColour.GREY,
    "purple": HairColour.PURPLE,
    "red": HairColour.RED,
    "sandy": HairColour.SANDY,
    "silver": HairColour.SILVER,
    "tawny": HairColour.TAWNY,
    "white": HairColour.WHITE
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

enum Patronus {
    BOAR,
    DOE,
    EMPTY,
    GOAT,
    HARE,
    HORSE,
    JACK_RUSSELL_TERRIER,
    LYNX,
    NON_CORPOREAL,
    OTTER,
    PERSIAN_CAT,
    PHOENIX,
    STAG,
    SWAN,
    TABBY_CAT,
    WEASEL,
    WOLF
}

final patronusValues = EnumValues({
    "boar": Patronus.BOAR,
    "doe": Patronus.DOE,
    "": Patronus.EMPTY,
    "goat": Patronus.GOAT,
    "hare": Patronus.HARE,
    "horse": Patronus.HORSE,
    "Jack Russell terrier": Patronus.JACK_RUSSELL_TERRIER,
    "lynx": Patronus.LYNX,
    "Non-Corporeal": Patronus.NON_CORPOREAL,
    "otter": Patronus.OTTER,
    "persian cat": Patronus.PERSIAN_CAT,
    "Phoenix": Patronus.PHOENIX,
    "stag": Patronus.STAG,
    "swan": Patronus.SWAN,
    "tabby cat": Patronus.TABBY_CAT,
    "weasel": Patronus.WEASEL,
    "wolf": Patronus.WOLF
});

class Wand {
    String wood;
    Core core;
    double? length;

    Wand({
        required this.wood,
        required this.core,
        required this.length,
    });

    factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: json["wood"],
        core: coreValues.map[json["core"]]!,
        length: json["length"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "wood": wood,
        "core": coreValues.reverse[core],
        "length": length,
    };
}

enum Core {
    DRAGON_HEARTSTRING,
    EMPTY,
    PHOENIX_FEATHER,
    PHOENIX_TAIL_FEATHER,
    UNICORN_HAIR,
    UNICORN_TAIL_HAIR
}

final coreValues = EnumValues({
    "dragon heartstring": Core.DRAGON_HEARTSTRING,
    "": Core.EMPTY,
    "phoenix feather": Core.PHOENIX_FEATHER,
    "phoenix tail feather": Core.PHOENIX_TAIL_FEATHER,
    "unicorn hair": Core.UNICORN_HAIR,
    "unicorn tail hair": Core.UNICORN_TAIL_HAIR
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
