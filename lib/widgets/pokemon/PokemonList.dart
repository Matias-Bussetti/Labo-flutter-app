import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';
import 'package:flutter_application_1/widgets/pokemon/PokemonItem.dart';
import 'package:flutter_application_1/widgets/pokemon/FetcherPokemon.dart'; // Asegúrate de importar la clase FetcherPokemon
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonList extends StatefulWidget {
  const PokemonList({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final List<Pokemon> _pokemon = [];
  String _searchQuery = "";
  bool _isSearching = false;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();
  final int _limit = 20;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    _fetchInitialPokemons();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        if (!_isSearching && !_isLoadingMore) {
          _fetchMorePokemons();
        }
      }
    });
  }

  Future<void> _fetchInitialPokemons() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final fetcher = FetcherPokemon(limit: _limit, offset: _offset);
      final newPokemons = await fetcher.fetchPokemons();
      setState(() {
        _pokemon.addAll(newPokemons);
        _offset += _limit;
      });
    } catch (e) {
      print("Error al cargar Pokémon iniciales: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchMorePokemons() async {
    setState(() {
      _isLoadingMore = true;
    });

    try {
      final fetcher = FetcherPokemon(limit: _limit, offset: _offset);
      final newPokemons = await fetcher.fetchPokemons();
      setState(() {
        _pokemon.addAll(newPokemons);
        _offset += _limit;
      });
    } catch (e) {
      print("Error al cargar más Pokémon: $e");
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  Future<List<Pokemon>> _fetchSearchResults(String query) async {
    final url =
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/pokemon/name/${query.toLowerCase()}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status'] == 200) {
        if (data['data'] is Map<String, dynamic>) {
          return [Pokemon.fromJson(data['data'])];
        } else if (data['data'] is List) {
          return data['data']
              .map<Pokemon>((item) => Pokemon.fromJson(item))
              .toList();
        }
      }
      throw Exception('Respuesta de la API inesperada: ${response.body}');
    } else {
      throw Exception('Error al buscar Pokémon');
    }
  }

  void _handleSearch(String value) {
    setState(() {
      _searchQuery = value.toLowerCase();
      _isSearching = value.isNotEmpty;
      if (!_isSearching) {
        _pokemon.clear();
        _offset = 0;
        _fetchInitialPokemons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _handleSearch,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar Pokémon por nombre...",
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          Expanded(
            child: _isSearching
                ? FutureBuilder<List<Pokemon>>(
                    future: _fetchSearchResults(_searchQuery),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error: ${snapshot.error}",
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("No se encontraron resultados."),
                        );
                      } else {
                        return GridView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final pokemon = snapshot.data![index];
                            return PokemonItem(pokemon: pokemon);
                          },
                        );
                      }
                    },
                  )
                : _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemCount: _pokemon.length + 1,
                        itemBuilder: (context, index) {
                          if (index == _pokemon.length) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final pokemon = _pokemon[index];
                          return PokemonItem(pokemon: pokemon);
                        },
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
