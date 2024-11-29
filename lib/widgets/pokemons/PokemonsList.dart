import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Pokemon.dart';
import 'package:flutter_application_1/widgets/pokemons/PokemonItem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonsList extends StatefulWidget {
  const PokemonsList({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  late List<Pokemon> _pokemons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _pokemons = Pokemon.listFromJson(widget.data);
    });
  }

  void _handleSearch(String value) {
    setState(() {
      if (value.isEmpty) {
        _pokemons = Pokemon.listFromJson(widget.data);
      } else {
        _pokemons = Pokemon.listFromJson(widget.data)
            .where((pokemon) =>
                (pokemon.name.toLowerCase()).contains(value.toLowerCase()) ||
                (pokemon.name.toLowerCase()).contains(value.toLowerCase()))
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
                hintText: "Buscar por Nombre",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _pokemons.length,
              itemBuilder: (BuildContext context, int index) {
                Pokemon pokemon = _pokemons[index];
                return PokemonItem(pokemon: pokemon);
              }),
        ),
      ],
    );
  }
}
