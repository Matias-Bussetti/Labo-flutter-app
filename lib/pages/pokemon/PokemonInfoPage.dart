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
      appBar: AppBar(
        title: const Text("Pokemon"),
        backgroundColor: Colors.lightBlue[500],
      ),
      body: Center(
        child: FutureFetcher(
          url:
              "https://tup-labo-4-grupo-15.onrender.com/api/v1/pokemon/${args.id}",
          widget: (data) {
            // Convierte el JSON recibido en un objeto Pokemon
            final pokemon = Pokemon.fromJson(data);
            return PokemonDescription(
                pokemon: pokemon); // Pasa el objeto Pokemon
          },
        ),
      ),
    );
  }
}
