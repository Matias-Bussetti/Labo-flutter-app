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
  bool _isSearching = false;
  String _searchQuery = "";
  int _currentPage = 0;
  final int _limit = 20;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _characters = MarvelChars.listFromJson(widget.data);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<MarvelChars>> _fetchSearchResults(String query, int offset) async {
    final url =
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/marvel/chars?nameStartsWith=$query&limit=$_limit&offset=$offset";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MarvelChars.listFromJson(data);
    } else {
      throw Exception('Error fetching search results');
    }
  }

  Future<void> _fetchMoreCharacters() async {
    if (_isLoadingMore || !_hasMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final newCharacters = await _fetchSearchResults(_searchQuery, _currentPage * _limit);
      setState(() {
        _characters.addAll(newCharacters);
        _hasMore = newCharacters.length == _limit;
        _currentPage++;
      });
    } catch (error) {
      debugPrint('Error fetching more characters: $error');
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _fetchMoreCharacters();
    }
  }

  void _handleSearch(String value) {
    setState(() {
      _searchQuery = value;
      _isSearching = value.isNotEmpty;
      _currentPage = 0;
      _hasMore = true;
      _characters.clear();
    });
    _fetchMoreCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: TextField(
            onChanged: _handleSearch,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xfff1f1f1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "Buscar personaje por nombre...",
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              prefixIconColor: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: _characters.length + (_isLoadingMore ? 1 : 0),
            itemBuilder: (BuildContext context, int index) {
              if (index == _characters.length) {
                return const Center(child: CircularProgressIndicator());
              }
              final character = _characters[index];
              return MarvelCharacterItem(character: character);
            },
          ),
        ),
        if (!_hasMore && _characters.isNotEmpty)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("No hay más resultados."),
          ),
      ],
    );
  }
}
