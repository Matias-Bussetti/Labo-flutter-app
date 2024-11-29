import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';
import 'package:flutter_application_1/classes/pokemon/PokemonInfoPageArguments.dart';
import 'package:flutter_application_1/helpers/TypeColorsPokemon.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonItem({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/pokemon-info',
          arguments: PokemonInfoPageArguments(pokemon.id),
        );
      },
      child: Container(
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
            Image.network(
              pokemon.image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
            Text(
              "#${pokemon.id}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Stack(
              children: [
                // Texto con borde negro
                Text(
                  pokemon.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "PokemonSolid",
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2.0 // Grosor del borde
                      ..color = Colors.black, // Color del borde
                  ),
                ),
                // Texto blanco superpuesto
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "PokemonSolid",
                    color: Colors.white, // Color del relleno del texto
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 4,
              alignment: WrapAlignment.center,
              children: pokemon.types.map((type) {
                return Chip(
                  label: Text(type),
                  backgroundColor: TypeColorPokemon(type),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
