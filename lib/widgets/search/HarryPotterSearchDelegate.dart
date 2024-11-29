import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async'; // Importamos para usar Timer
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';
import 'package:flutter_application_1/widgets/harry_potter/HarryPotterItem.dart';

class HarryPotterSearchDelegate extends SearchDelegate {
  Timer? _debounce; // Declaro el debounce para el timer

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Limpiamos el texto de búsqueda
          _debounce?.cancel(); // Cancelamos el timer si existe
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
        _debounce?.cancel(); // Cancelamos el timer si existe
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Datum>>(
      future: _fetchCharacters(query), // Llama a la búsqueda después del debounce
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
    if (_debounce?.isActive ?? false) _debounce!.cancel(); // Cancelamos si hay debounce activo

    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Ejecutamos después de 500ms
      showSuggestions(context); // Mostramos sugerencias
    });

    if (query.isEmpty) {
      return Container(); // Sin sugerencias si no hay texto
    }
    return buildResults(context); // Reutiliza buildResults
  }

  Future<List<Datum>> _fetchCharacters(String query) async {
    final url =
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/todoslospersonajes?name=$query";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List<dynamic>;
      return data.map((json) => Datum.fromJson(json)).toList();
    } else {
      throw Exception('Error al buscar personajes');
    }
  }

  @override
  void dispose() {
    _debounce?.cancel(); // Liberamos el timer al cerrar el buscador
    super.dispose();
  }
}
