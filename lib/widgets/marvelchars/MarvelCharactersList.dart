import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';
import 'package:flutter_application_1/widgets/marvelchars/MarvelCharacterItem.dart';


class MarvelCharactersList extends StatefulWidget {
  const MarvelCharactersList({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  State<MarvelCharactersList> createState() => _MarvelCharactersListState();
}

class _MarvelCharactersListState extends State<MarvelCharactersList> {
  late List<MarvelChars> _characters;

  @override
  void initState() {
    super.initState();
    // Inicializa los personajes con el método estático correcto
    _characters = MarvelChars.listFromJson(widget.data);
  }

  void _handleSearch(String value) {
    setState(() {
      if (value.isEmpty) {
        // Restaura la lista original
        _characters = MarvelChars.listFromJson(widget.data);
      } else {
        // Filtra los personajes según el nombre o la descripción
        _characters = MarvelChars.listFromJson(widget.data)
            .where((character) =>
                character.name.toLowerCase().contains(value.toLowerCase()) ||
                character.description.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: SizedBox(
            height: 45,
            width: 360,
            child: TextField(
              onChanged: _handleSearch,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar por Nombre o Descripción",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: _characters.length,
            itemBuilder: (BuildContext context, int index) {
              MarvelChars character = _characters[index];
              return MarvelCharacterItem(character: character);
            },
          ),
        ),
      ],
    );
  }
}
