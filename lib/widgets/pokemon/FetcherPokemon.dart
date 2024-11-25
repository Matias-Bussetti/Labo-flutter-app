import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/classes/pokemon/Pokemon.dart';

class FetcherPokemon {
  final int limit;
  final int offset;

  FetcherPokemon({required this.limit, required this.offset});

  Future<List<Pokemon>> fetchPokemons() async {
    final url = 'https://tup-labo-4-grupo-15.onrender.com/api/v1/pokemon/search?limit=$limit&offset=$offset';
    
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Si la respuesta es correcta, decodificamos el JSON
        final data = jsonDecode(response.body);
        // Convierte los datos decodificados a una lista de objetos Pokemon
        return Pokemon.listFromJson(data);
      } else {
        throw Exception('Error al cargar los Pokémon');
      }
    } catch (e) {
      print("Error al cargar los Pokémon: $e");
      throw Exception('Error al cargar los Pokémon');
    }
  }
}
