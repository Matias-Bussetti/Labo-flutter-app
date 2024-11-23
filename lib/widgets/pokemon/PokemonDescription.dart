import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';

class PokemonDescription extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDescription({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.lightBlue[500],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen del Pokémon
              Image.network(
                pokemon.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              // Nombre e ID del Pokémon
              Text(
                "${pokemon.name.toUpperCase()} (#${pokemon.id})",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Tipos del Pokémon
              Wrap(
                spacing: 8,
                children: pokemon.types
                    .map(
                      (type) => Chip(
                        label: Text(type),
                        backgroundColor: Colors.blueAccent.withOpacity(0.7),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              // Descripción o información adicional
              Text(
                "Este Pokémon pertenece a los tipos mencionados y es muy especial en tus aventuras. Aquí podrías agregar información extra si tienes datos adicionales en tu API.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
