// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';
import 'package:flutter_application_1/widgets/custom/CustomCardMarvelChars.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';

class MarvelCharacterItem extends StatelessWidget {
  final MarvelChars character;

  const MarvelCharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return CustomCardMarvelChars(
      imageUrl: character.thumbnail,
      title: character.name,
      trailingIcon: IsFavoriteIcon(
        id: character.name,
        color: Colors.yellow,
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/marvelchars/id',
          arguments: character,
        );
      },
    );
  }
}

