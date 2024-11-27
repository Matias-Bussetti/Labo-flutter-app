import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';
import 'package:flutter_application_1/widgets/pokemon/PokemonItem.dart';
import 'package:flutter_application_1/widgets/pokemon/FetcherPokemon.dart'; // Asegúrate de importar la clase FetcherPokemon

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
  late List<Pokemon> _pokemon = [];
  late List<Pokemon> _filteredPokemon = [];
  int _limit = 20;
  int _offset = 0;
  bool _isLoading = false;
  bool _isFetching =
      false;
  final ScrollController _scrollController =
      ScrollController();
  final TextEditingController _searchController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchMorePokemons();
  }

  Future<void> _fetchMorePokemons() async {
    if (_isLoading || _isFetching) return;

    setState(() {
      _isLoading = true;
      _isFetching = true;
    });

    try {
      final fetcher = FetcherPokemon(limit: _limit, offset: _offset);
      final newPokemons = await fetcher.fetchPokemons();

      setState(() {
        _pokemon.addAll(newPokemons);
        _filteredPokemon =
            _pokemon;
        _offset += _limit;
      });
    } catch (e) {
      print("Error al cargar más Pokémon: $e");
    } finally {
      setState(() {
        _isLoading = false;
        _isFetching =
            false; 
      });
    }
  }

  void _filterPokemons(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredPokemon =
            _pokemon; 
      } else {
        _filteredPokemon = _pokemon
            .where((pokemon) =>
                pokemon.name.toLowerCase().contains(query.toLowerCase()))
            .toList(); 
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
              controller: _searchController,
              onChanged: _filterPokemons,
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
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    !_isLoading) {
                  _fetchMorePokemons();
                }
                return false;
              },
              child: GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: _filteredPokemon.length,
                itemBuilder: (context, index) {
                  final pokemon = _filteredPokemon[index];
                  return PokemonItem(pokemon: pokemon);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(
                milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: const Icon(Icons.arrow_upward), 
        backgroundColor: Colors.blue,
      ),
    );
  }
}
