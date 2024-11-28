import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HarryPotterSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '', // Resetea el texto directamente
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null), // Cierra la búsqueda
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _fetchCharacters(query),
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
              final character = characters[index];
              return ListTile(
                title: Text(character['name']),
                subtitle: Text(
                    'Casa: ${character['house'] ?? 'Sin información'}'),
                onTap: () {
                  // Aquí se puede manejar la navegación
                },
              );
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
      return Container();
    }
    return buildResults(context); // Reutilizamos buildResults para mostrar resultados dinámicos
  }

  Future<List<dynamic>> _fetchCharacters(String query) async {
    final url =
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/personajes?name=$query&limit=50&page=1";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return data;
    } else {
      throw Exception('Error al buscar personajes');
    }
  }
}
