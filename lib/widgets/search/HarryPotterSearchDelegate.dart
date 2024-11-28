import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HarryPotterSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '', // Limpiar la búsqueda
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null), // Cerrar la búsqueda
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _fetchCharacters(query), //Busca en la api con el texto ingresado
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
      return Container(); // Sin sugerencias si no hay texto
    }
    return buildResults(context); // Reutiliza buildResults
  }

  // Realizar la búsqueda en la API pasando el parámetro "name"
  Future<List<dynamic>> _fetchCharacters(String query) async {
    final url =
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/todoslospersonajes?name=$query";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return data;
    } else {
      throw Exception('Error al buscar personajes');
    }
  }
}