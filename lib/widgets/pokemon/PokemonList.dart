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
  late final List<Pokemon> _pokemon = [];
  final int _limit = 20; // Número de Pokémon a cargar por página
  int _offset = 0; // Desde dónde empezar
  bool _isLoading = false;
  final ScrollController _scrollController =
      ScrollController(); // Controlador para el desplazamiento

  @override
  void initState() {
    super.initState();
    _fetchMorePokemons(); // Carga inicial
  }

  Future<void> _fetchMorePokemons() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Usamos el PokemonFetcher en lugar de hacer la solicitud directamente
      final fetcher = FetcherPokemon(limit: _limit, offset: _offset);
      final newPokemons = await fetcher.fetchPokemons();

      setState(() {
        _pokemon.addAll(newPokemons);
        _offset += _limit; // Incrementa el offset para la próxima carga
      });
    } catch (e) {
      print("Error al cargar más Pokémon: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              !_isLoading) {
            _fetchMorePokemons(); // Carga más cuando llegue al final
          }
          return false;
        },
        child: GridView.builder(
          controller: _scrollController, // Asocia el controlador
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: _pokemon.length,
          itemBuilder: (context, index) {
            final pokemon = _pokemon[index];
            return PokemonItem(pokemon: pokemon);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0, // Desplázate hasta la parte superior
            duration: const Duration(
                milliseconds: 300), // Duración del desplazamiento
            curve: Curves.easeInOut, // Tipo de curva de desplazamiento
          );
        }, // Icono del botón
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_upward), // Color del botón
      ),
    );
  }
}
