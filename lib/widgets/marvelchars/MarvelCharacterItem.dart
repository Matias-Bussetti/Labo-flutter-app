import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';

class MarvelCharacterItem extends StatelessWidget {
  final MarvelChars character;

  const MarvelCharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/marvelchars/id',
          arguments: character,
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(character.thumbnail),
          ),
          title: Text(character.name),
        ),
      ),
    );
  }
}
