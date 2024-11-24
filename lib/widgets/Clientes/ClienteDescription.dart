import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/cliente.dart';
import 'package:intl/intl.dart'; // Importamos intl para formatear la fecha

class ClienteDescription extends StatelessWidget {
  final Map<String, dynamic> data;
  const ClienteDescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    print("Contenido de data: $data");

    if (data["data"] == null) {
      return const Center(
        child: Text("Los datos del cliente no están disponibles"),
      );
    }

    Cliente cliente = Cliente.fromJson(data["data"]);

    // Formato de la fecha (día, mes, año)
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    String formattedDate = dateFormat.format(DateTime.parse(cliente.fechaNac));

    // Determinar género basado en el valor de cliente.genero
    String generoTexto = cliente.genero == "male" ? "Masculino" : "Femenino";

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Datos del cliente - Nombre y Email (cambiado a icono de people)
          RowData(
            icon: Icons.person, // Cambiamos el icono aquí
            children: [
              Text(
                "${cliente.nombre}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                cliente.email,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          // Dirección
          RowData(
            icon: Icons.map,
            children: [
              Text(
                cliente.direccion,
              ),
            ],
          ),

          // Fecha de nacimiento (formateada a dd/MM/yyyy)
          RowData(
            icon: Icons.date_range_outlined,
            children: [
              Text(
                "Fecha de nacimiento: $formattedDate",
              ),
            ],
          ),

          // DNI
          RowData(
            icon: Icons.assignment_ind,
            children: [
              Text(
                "DNI: ${cliente.dni}",
              ),
            ],
          ),

          // Género (con el texto ajustado)
          RowData(
            icon: cliente.genero == "male" ? Icons.male : Icons.female,
            children: [
              Text(
                "Género: $generoTexto",
              ),
            ],
          ),

          // Estado VIP
          RowData(
            icon: cliente.bip ? Icons.check_circle : Icons.cancel,
            children: [
              Text(
                "VIP: ${cliente.bip ? 'SI' : 'NO'}",
              ),
            ],
          ),

          // ID del cliente
          RowData(
            icon: Icons.code,
            children: [
              Text(
                "ID: ${cliente.id}",
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
      padding: const EdgeInsets.all(15), // Centramos el contenido
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ), // Agregamos margen entre los elementos
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue[200]!, width: 1),
        borderRadius: BorderRadius.circular(8), // Bordes redondeados
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue[200],
            size: 35.0,
          ),
          const SizedBox(width: 15), // Espacio entre el icono y el texto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
