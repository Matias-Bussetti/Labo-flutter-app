import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';
import 'package:flutter_application_1/widgets/harry_potter/HarryPotterItem.dart';

class HarryPotterList extends StatefulWidget {
  final List<HarryPotterCharacters> characters;

  const HarryPotterList({Key? key, required this.characters}) : super(key: key);

  @override
  State<HarryPotterList> createState() => _HarryPotterListState();
}

class _HarryPotterListState extends State<HarryPotterList> {
  late List<HarryPotterCharacters> _filteredCharacters;

  @override
  void initState() {
    super.initState();
    _filteredCharacters = widget.characters; // Inicialmente mostramos todos los personajes.
  }

  void _handleSearch(String value) {
    setState(() {
      if (value.isEmpty) {
        _filteredCharacters = widget.characters; // Restauramos la lista original si no hay texto.
      } else {
        _filteredCharacters = widget.characters
            .where((character) => character.name.toLowerCase().contains(value.toLowerCase()))
            .toList(); // Filtramos los personajes por nombre.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda
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
                hintText: "Buscar por Nombre",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ),

        // Lista de personajes
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: _filteredCharacters.length,
            itemBuilder: (BuildContext context, int index) {
              final character = _filteredCharacters[index];
              return HarryPotterItem(character: character);
            },
          ),
        ),
      ],
    );
  }
}
