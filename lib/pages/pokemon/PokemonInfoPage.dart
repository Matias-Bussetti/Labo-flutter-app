import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';
import 'package:flutter_application_1/classes/pokemon/PokemonInfoPageArguments.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/pokemon/PokemonDescription.dart';

class PokemonInfoPage extends StatefulWidget {
  const PokemonInfoPage({
    super.key,
  });

  @override
  State<PokemonInfoPage> createState() => _PokemonInfoPageState();
}

class _PokemonInfoPageState extends State<PokemonInfoPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PokemonInfoPageArguments;

    return Scaffold(
      body: Center(
        child: FutureFetcher(
          url:
              "https://tup-labo-4-grupo-15.onrender.com/api/v1/pokemon/${args.id}",
          widget: (data) {
            final pokemonData = data["data"];

            if (pokemonData == null) {
              return const Text(
                "Error: No se pudieron cargar los datos del Pokémon.",
                style: TextStyle(color: Colors.red),
              );
            }

            final pokemon = Pokemon.fromJson(pokemonData);
            return PokemonDescription(pokemon: pokemon);
          },
        ),
      ),
    );
  }
}
