import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';
import 'package:flutter_application_1/widgets/harry_potter/HarryPotterItem.dart';

class HarryPotterList extends StatefulWidget {
  final List<Datum> characters;

  const HarryPotterList({super.key, required this.characters});

  @override
  _HarryPotterListState createState() => _HarryPotterListState();
}

class _HarryPotterListState extends State<HarryPotterList> {
  late List<Datum> filteredCharacters;

  @override
  void initState() {
    super.initState();
    filteredCharacters = widget.characters;
  }

  void _filterCharacters(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCharacters = widget.characters;
      } else {
        filteredCharacters = widget.characters
            .where((character) => character.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: _filterCharacters,
            decoration: InputDecoration(
              hintText: "Buscar personaje",
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredCharacters.length,
            itemBuilder: (context, index) {
              return HarryPotterItem(character: filteredCharacters[index]);
            },
          ),
        ),
      ],
    );
  }
}
