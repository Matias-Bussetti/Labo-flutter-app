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

    if (args == null || args.id == null) {
      return Scaffold(
        body: Center(
          child: Text("No se pudo cargar la información del Pokémon"),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: FutureFetcher(
          url:
              "https://tup-labo-4-grupo-15.onrender.com/api/v1/pokemon/${args.id}",
          widget: (data) {
            // Accede a la clave "data" del JSON antes de convertirlo
            final pokemonData = data["data"];

            // Valida que los datos sean correctos
            if (pokemonData == null) {
              return const Text(
                "Error: No se pudieron cargar los datos del Pokémon.",
                style: TextStyle(color: Colors.red),
              );
            }

            // Convierte el JSON recibido en un objeto Pokemon
            final pokemon = Pokemon.fromJson(pokemonData);
            return PokemonDescription(
                pokemon: pokemon); // Pasa el objeto Pokemon
          },
        ),
      ),
    );
  }
}
