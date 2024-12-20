import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';
import 'package:flutter_application_1/helpers/TypeColorsPokemon.dart';
import 'package:flutter_application_1/helpers/PokemonTypeTranslator.dart';

class PokemonDescription extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDescription({super.key, required this.pokemon});

  Widget _buildStatRow(String label, int value, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: value / 150,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 10,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Descripción del Pokémon"),
        backgroundColor: Colors.lightBlue[500],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IsFavoriteIcon(
              id: pokemon.id.toString(),
              color: Colors.yellow,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                pokemon.image,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                "${pokemon.name.toUpperCase()} (#${pokemon.id})",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                alignment: WrapAlignment.center,
                children: pokemon.types.map((type) {
                  return Chip(
                    label: Text(
                      _capitalize(
                        PokemonTypeTranslator.translateToSpanish(type),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: TypeColorPokemon(type),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              _buildStatRow("HP", pokemon.stats.hp, Icons.favorite, Colors.red),
              _buildStatRow("Ataque", pokemon.stats.attack, Icons.flash_on,
                  Colors.orange),
              _buildStatRow(
                  "Defensa", pokemon.stats.defense, Icons.shield, Colors.blue),
              _buildStatRow("Ataque Especial", pokemon.stats.specialAttack,
                  Icons.local_fire_department, Colors.purple),
              _buildStatRow("Defensa Especial", pokemon.stats.specialDefense,
                  Icons.security, Colors.teal),
              _buildStatRow("Velocidad", pokemon.stats.speed,
                  Icons.directions_run, Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
