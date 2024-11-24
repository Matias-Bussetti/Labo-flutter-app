import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Cliente.dart';
import 'package:flutter_application_1/classes/ClienteInfoPageArguments.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';

class ClienteItem extends StatelessWidget {
  final Cliente cliente;
  const ClienteItem({Key? key, required this.cliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: InkWell(
        onTap: () {
          // Navegar a la página de detalle del cliente pasando el ID
          Navigator.pushNamed(
            context,
            '/cliente/buscar',
            arguments: ClienteInfoPageArguments(
              cliente.id, // Pasamos el ID del cliente
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Imagen de avatar
              Expanded(
                flex: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(90),
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/cliente/avatar1.png'), // Imagen estática
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Información del cliente
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cliente.nombre, // Nombre del cliente
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        cliente.email, // Email del cliente
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
              // Icono de favorito
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    IsFavoriteIcon(
                        id: 'cliente-${cliente.id}') // Favorito por ID
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
