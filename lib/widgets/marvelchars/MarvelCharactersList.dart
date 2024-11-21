import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';
import 'package:flutter_application_1/widgets/marvelchars/MarvelCharacterItem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  bool _isSearching = false; // Indicador de búsqueda activa
  String _searchQuery = ""; // Consulta actual

  @override
  void initState() {
    super.initState();
    // Inicializa los personajes con el método estático correcto
    _characters = MarvelChars.listFromJson(widget.data);
  }

  void _handleSearch(String value) {
    setState(() {
      _searchQuery = value;
      _isSearching = value.isNotEmpty;
    });
  }

  Future<List<MarvelChars>> _fetchSearchResults(String query) async {
    final url =
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/marvel/chars?nameStartsWith=$query";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MarvelChars.listFromJson(data);
    } else {
      throw Exception('Error fetching search results');
    }
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
                hintText: "Buscar por nombre...",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          child: _isSearching
              ? FutureBuilder<List<MarvelChars>>(
                  future: _fetchSearchResults(_searchQuery),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Error: ${snapshot.error}",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("No se encontraron resultados."),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          MarvelChars character = snapshot.data![index];
                          return MarvelCharacterItem(character: character);
                        },
                      );
                    }
                  },
                )
              : ListView.builder(
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
