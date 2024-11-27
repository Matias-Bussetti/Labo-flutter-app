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
  late List<Pokemon> _pokemon = []; // Lista general
  String _searchQuery = ""; // Texto de búsqueda
  bool _isSearching = false; // Indicador de búsqueda activa
  bool _isLoading = false; // Indicador de carga inicial
  bool _isLoadingMore = false; // Indicador de carga al obtener más datos
  final ScrollController _scrollController = ScrollController();
  int _limit = 20;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    _fetchInitialPokemons();

    // Agregar listener para detectar cuando llegamos al final del scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        // Solo cargar más si no estamos en búsqueda
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
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/pokemon/search?name=$query";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status'] == 200 && data['data'] is List) {
        return data['data']
            .map<Pokemon>((item) => Pokemon.fromJson(item))
            .toList();
      } else {
        throw Exception('Respuesta de la API inesperada: ${response.body}');
      }
    } else {
      throw Exception('Error al buscar Pokémon');
    }
  }

  void _handleSearch(String value) {
    setState(() {
      _searchQuery = value;
      _isSearching = value.isNotEmpty;
      if (!_isSearching) {
        // Si la búsqueda está vacía, resetear la lista y cargar los Pokémon nuevamente
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
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar Pokémon por nombre...",
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
                        itemCount: _pokemon.length +
                            1, // Añadir uno para el cargando más
                        itemBuilder: (context, index) {
                          if (index == _pokemon.length) {
                            // Indicador de carga más
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
        child: const Icon(Icons.arrow_upward),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
