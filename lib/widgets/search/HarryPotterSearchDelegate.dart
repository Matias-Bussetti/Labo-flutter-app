import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';
import 'package:flutter_application_1/widgets/harry_potter/HarryPotterItem.dart';

class HarryPotterSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Limpiamos el texto de búsqueda
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Cerramos el buscador
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Datum>>(
      future: _fetchCharacters(query), // Busca en la API con el texto ingresado
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
              size: 80,
            ),
          );
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final characters = snapshot.data!;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return HarryPotterItem(character: characters[index]);
            },
          );
        } else {
          return const Center(
            child: Text("No se encontraron resultados."),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(); // Sin sugerencias si no hay texto
    }
    return buildResults(context); // Reutiliza buildResults para mostrar resultados similares
  }

  // Realizar la búsqueda en la API pasando el parámetro "name"
  Future<List<Datum>> _fetchCharacters(String query) async {
    final url =
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/todoslospersonajes?name=$query";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List<dynamic>;
      // Convierte los resultados en objetos Datum
      return data.map((json) => Datum.fromJson(json)).toList();
    } else {
      throw Exception('Error al buscar personajes');
    }
  }
}
