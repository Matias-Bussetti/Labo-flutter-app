import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Cliente.dart';
import 'package:flutter_application_1/widgets/clientes/ClienteItem.dart';

class ClientesList extends StatefulWidget {
  const ClientesList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<ClientesList> createState() => _ClientesListState();
}

class _ClientesListState extends State<ClientesList> {
  late List<Cliente> _clientes;

  @override
  void initState() {
    super.initState();
    setState(() {
      // Verificamos si 'data' contiene la clave 'data' y la convertimos a List<Cliente>
      if (widget.data.containsKey('data')) {
        _clientes = Cliente.listFromJson(widget.data); // Devuelve List<Cliente>
      } else {
        _clientes = []; // Si no hay 'data', usamos una lista vacía
      }
    });
  }

  void _handleSearch(String value) {
    setState(() {
      if (value.isEmpty) {
        _clientes =
            Cliente.listFromJson(widget.data); // Refresca la lista completa
      } else {
        // Filtra los clientes por nombre (asegurando que 'nombre' no sea nulo)
        _clientes = Cliente.listFromJson(widget.data)
            .where((cliente) =>
                cliente.nombre.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: SizedBox(
            height: 45,
            width: 360,
            child: TextField(
              onChanged: _handleSearch,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar por Nombre",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ),
        // Lista de clientes
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: _clientes.length,
            itemBuilder: (BuildContext context, int index) {
              Cliente cliente =
                  _clientes[index]; // Trabaja directamente con Cliente
              return ClienteItem(
                  cliente: cliente); // Usa ClienteItem para renderizar
            },
          ),
        ),
      ],
    );
  }
}
