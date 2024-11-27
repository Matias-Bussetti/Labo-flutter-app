import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

class HarryPotterSearchDelegate extends SearchDelegate<Datum?> {
  final List<Datum> characters;

  HarryPotterSearchDelegate(this.characters);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Limpiamos el texto de búsqueda
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Cerramos el buscador
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = characters.where((character) {
      return character.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final character = results[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(character.image),
          ),
          title: Text(character.name),
          subtitle: Text(houseValues.reverse[character.house] ?? 'Sin casa'),
          onTap: () {
            Navigator.pushNamed(context, '/harryPotterInfo', arguments: character);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = characters.where((character) {
      return character.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final character = suggestions[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(character.image),
          ),
          title: Text(character.name),
          onTap: () {
            query = character.name;
            showResults(context);
          },
        );
      },
    );
  }
}
