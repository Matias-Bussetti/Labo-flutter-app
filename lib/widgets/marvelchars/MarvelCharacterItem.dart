import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';

class MarvelCharacterItem extends StatelessWidget {
  final MarvelChars character;

  const MarvelCharacterItem({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(character.thumbnail, width: 50, height: 50),
        title: Text(character.name),
        subtitle: Text(
          character.description.isNotEmpty
              ? character.description
              : "Sin descripción",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          // Acción al seleccionar un personaje
        },
      ),
    );
  }
}