import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';
import 'package:flutter_application_1/widgets/marvelchars/MarvelCharacterItem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MarvelSearchDelegate extends SearchDelegate<MarvelChars?> {
  MarvelSearchDelegate();

  Future<List<MarvelChars>> _fetchSearchResults(String query) async {
    const int limit = 20;
    final url =
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/marvel/chars?nameStartsWith=$query&limit=$limit";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MarvelChars.listFromJson(data);
    } else {
      throw Exception('Error fetching search results');
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<MarvelChars>>(
      future: _fetchSearchResults(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final characters = snapshot.data ?? [];

        if (characters.isEmpty) {
          return const Center(child: Text('No se encontraron resultados.'));
        }

        return ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character = characters[index];

            return MarvelCharacterItem(character: character);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Introduce un nombre para buscar.'));
    }
    return FutureBuilder<List<MarvelChars>>(
      future: _fetchSearchResults(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final suggestions = snapshot.data ?? [];

        if (suggestions.isEmpty) {
          return const Center(child: Text('No se encontraron sugerencias.'));
        }

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final character = suggestions[index];

            return InkWell(
              onTap: () {
                query = character.name;
                showResults(context);
              },
              child: MarvelCharacterItem(character: character),
            );
          },
        );
      },
    );
  }

}
