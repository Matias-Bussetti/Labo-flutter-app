import 'dart:convert';

MarvelCharacters marvelCharsFromJson(String str) => MarvelCharacters.fromJson(json.decode(str));

String marvelCharsToJson(MarvelCharacters data) => json.encode(data.toJson());

class MarvelCharacters {
    int status;
    List<MarvelChars> data;
    int requestTime;

    MarvelCharacters({
        required this.status,
        required this.data,
        required this.requestTime,
    });

    factory MarvelCharacters.fromJson(Map<String, dynamic> json) => MarvelCharacters(
        status: json["status"],
        data: List<MarvelChars>.from(json["data"].map((x) => MarvelChars.fromJson(x))),
        requestTime: json["requestTime"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "requestTime": requestTime,
    };
}

class MarvelChars {
  int id;
  String name;
  String description;
  String modified;
  String thumbnail;
  List<String> series;

  MarvelChars({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.series,
  });

  factory MarvelChars.fromJson(Map<String, dynamic> json) => MarvelChars(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: json["thumbnail"],
        series: List<String>.from(json["series"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail,
        "series": List<dynamic>.from(series.map((x) => x)),
      };

  // Nuevo método estático para convertir una lista de JSON a objetos MarvelChars
  static List<MarvelChars> listFromJson(Map<String, dynamic> json) {
    return List<MarvelChars>.from(
        json['data'].map((character) => MarvelChars.fromJson(character)));
  }
}