import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';
import 'package:flutter_application_1/helpers/TypeColorsPokemon.dart';

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
                children: pokemon.types.map((type) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: TypeColorPokemon(type),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                        )),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Stack(
                      children: [
                        // Texto con borde negro
                        Text(
                          type.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2.0 // Grosor del borde
                              ..color = Colors.black26, // Color del borde
                          ),
                        ),
                        // Texto blanco superpuesto
                        Text(
                          type.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Colors.white, // Color del relleno del texto
                          ),
                        ),
                      ],
                    ),
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
}
