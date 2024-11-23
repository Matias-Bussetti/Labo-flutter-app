// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';

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
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.all(8.0),
        child: GridTile(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              children: [
                // Imagen del personaje
                Positioned.fill(
                  child: Image.network(
                    character.thumbnail.isNotEmpty
                        ? character.thumbnail
                        : 'https://wallpapers.com/images/hd/marvel-logo-in-red-background-3p16v5avq80km4ns.jpg', // Imagen de respaldo
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          footer: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.black.withOpacity(0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Nombre del personaje
                Expanded(
                  child: Text(
                    character.name,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Icono de favorito
                IsFavoriteIcon(
                  id: character.name,
                  color: Colors.yellow, // Cambiar color a amarillo
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
