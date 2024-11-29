import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

class HarryPotterResponse {
  final List<Datum> characters;

  HarryPotterResponse({required this.characters});

  factory HarryPotterResponse.fromJson(Map<String, dynamic> json) {
    return HarryPotterResponse(
      characters: List<Datum>.from(
        json['data'].map((item) => Datum.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': characters.map((character) => character.toJson()).toList(),
    };
  }
}
