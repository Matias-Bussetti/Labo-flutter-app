import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';

class MarvelCharacterDescription extends StatelessWidget {
  final Map<String, dynamic> data;
  const MarvelCharacterDescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    MarvelChars character = MarvelChars.fromJson(data["data"]);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Imagen del personaje
          Stack(
            children: [
              Container(
                height: screenWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: NetworkImage(character.thumbnail),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              // Icono de favorito en la esquina superior derecha
              Positioned(
                top: 8.0,
                right: 8.0,
                child: IsFavoriteIcon(
                  id: character.name,
                  color: Colors.yellow,
                  size: 50.0,
                ),
              ),
            ],
          ),
          // Nombre del personaje
          RowData(
            icon: Icons.person,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  character.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // Descripción del personaje
          if (character.description.isNotEmpty)
            RowData(
              icon: Icons.description,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    character.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          // Series en las que aparece el personaje
          if (character.series.isNotEmpty)
            RowData(
              icon: Icons.tv,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Series: ${character.series.join(", ")}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class RowData extends StatelessWidget {
  const RowData({
    super.key,
    required this.children,
    required this.icon,
  });

  final List<Widget> children;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.red[200],
                  size: 35.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
