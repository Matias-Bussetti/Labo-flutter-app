import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/cliente.dart';

class ClienteDescription extends StatelessWidget {
  final Map<String, dynamic> data;
  const ClienteDescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    print("Contenido de data: $data");

    if (data["data"] == null) {
      return Center(
        child: Text("Los datos del cliente no están disponibles"),
      );
    }

    Cliente cliente = Cliente.fromJson(data["data"]);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Imagen del cliente (simulando una foto de perfil)
          Container(
            height: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
            ),
          ),

          // Datos básicos del cliente
          RowData(
            icon: cliente.genero == "Masculino" ? Icons.male : Icons.female,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${cliente.nombre} ${cliente.nombre}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  cliente.email,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          // Dirección del cliente
          RowData(
            icon: Icons.map,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${cliente.direccion},",
                ),
              ),
            ],
          ),
          // Información adicional del cliente
          RowData(
            icon: Icons.date_range_outlined,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Genero: ${cliente.genero}",
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Fecha: ${cliente.fechaNac}",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowData extends StatelessWidget {
  const RowData({
    super.key,
    required this.children,
    required this.icon,
  });

  final List<Widget> children;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.blue[200],
                  size: 35.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
