import 'package:flutter_application_1/classes/MarvelCharacters.dart';

class MarvelCharactersResponse {
  final List<MarvelChars> marvelChars;

  MarvelCharactersResponse({required this.marvelChars});

  factory MarvelCharactersResponse.fromJson(Map<String, dynamic> json) {
    return MarvelCharactersResponse(
      marvelChars: List<MarvelChars>.from(
          json['data'].map((marvelChar) => MarvelChars.fromJson(marvelChar))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': marvelChars.map((marvelChar) => marvelChar.toJson()).toList(),
    };
  }
}
