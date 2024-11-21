import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';
import 'package:flutter_application_1/widgets/pokemon/PokemonItem.dart';

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
  late List<Pokemon> _pokemon;

  @override
  void initState() {
    super.initState();
    // Inicializa los Pokémon con el método estático correcto
    _pokemon = Pokemon.listFromJson(widget.data);
  }

  void _handleSearch(String value) {
    setState(() {
      if (value.isEmpty) {
        // Restaura la lista original
        _pokemon = Pokemon.listFromJson(widget.data);
      } else {
        // Filtra los Pokémon según el nombre
        _pokemon = Pokemon.listFromJson(widget.data)
            .where((pokemon) =>
                pokemon.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: SizedBox(
            height: 60,
            width: 360,
            child: TextField(
              onChanged: _handleSearch,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 240, 240, 240),
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
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              crossAxisSpacing: 8,
              mainAxisSpacing: 8, 
              childAspectRatio: 1,
            ),
            itemCount: _pokemon.length,
            itemBuilder: (context, index) {
              Pokemon pokemon = _pokemon[index];
              return PokemonItem(pokemon: pokemon);
            },
          ),
        ),
      ],
    );
  }
}
