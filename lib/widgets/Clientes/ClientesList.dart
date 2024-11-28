import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Cliente.dart';
import 'package:flutter_application_1/widgets/clientes/ClienteItem.dart';

class ClientesList extends StatefulWidget {
  const ClientesList({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  State<ClientesList> createState() => _ClientesListState();
}

class _ClientesListState extends State<ClientesList> {
  late List<Cliente> _clientes;
  bool _isSearching = false; // Indicador de búsqueda activa
  String _searchQuery = ""; // Consulta actual

  @override
  void initState() {
    super.initState();
    // Inicializa los clientes con el método estático correcto
    _clientes = Cliente.listFromJson(widget.data);
  }

  void _handleSearch(String value) {
    setState(() {
      _searchQuery = value;
      _isSearching = value.isNotEmpty;
    });
  }

  Future<List<Cliente>> _fetchSearchResults(String query) async {
    final url =
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/clientes/nombre?nombre=$query";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Cliente.listFromJson(data);
    } else {
      throw Exception('Error al buscar clientes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: TextField(
            onChanged: _handleSearch,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xfff1f1f1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "Buscar cliente por nombre...",
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              prefixIconColor: Colors.black,
            ),
          ),
        ),
        // Lista de clientes
        Expanded(
          child: _isSearching
              ? FutureBuilder<List<Cliente>>(
                  future: _fetchSearchResults(_searchQuery),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Error: ${snapshot.error}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("No se encontraron resultados."),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          Cliente cliente = snapshot.data![index];
                          return ClienteItem(cliente: cliente);
                        },
                      );
                    }
                  },
                )
              : ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _clientes.length,
                  itemBuilder: (BuildContext context, int index) {
                    Cliente cliente = _clientes[index];
                    return ClienteItem(cliente: cliente);
                  },
                ),
        ),
      ],
    );
  }
}
