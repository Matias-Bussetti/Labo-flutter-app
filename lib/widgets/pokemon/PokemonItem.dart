import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonItem({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('lib/assets/images/pokeball_wallpaper.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(255, 194, 194, 194),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              pokemon.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "#${pokemon.id}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            pokemon.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Wrap(
            spacing: 4,
            alignment: WrapAlignment.center,
            children: pokemon.types.map((type) {
              return Chip(
                label: Text(type),
                backgroundColor: const Color.fromARGB(255, 202, 226, 247),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
