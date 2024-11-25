import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Cliente.dart';
import 'package:flutter_application_1/classes/ClienteInfoPageArguments.dart';

class ClienteItem extends StatelessWidget {
  final Cliente cliente;
  ClienteItem({super.key, required this.cliente});

  // Listas de imágenes según el género
  final List<String> avatarMaleImages = [
    'lib/assets/cliente/MaleAvatar1.png',
    'lib/assets/cliente/MaleAvatar2.png',
    'lib/assets/cliente/MaleAvatar4.png',
    'lib/assets/cliente/MaleAvatar6.png',
    'lib/assets/cliente/MaleAvatar9.png',
    'lib/assets/cliente/MaleAvatar10.png',
    'lib/assets/cliente/MaleAvatar11.png',
    'lib/assets/cliente/MaleAvatar13.png',
  ];

  final List<String> avatarFemaleImages = [
    'lib/assets/cliente/FemaleAvatar3.png',
    'lib/assets/cliente/FemaleAvatar5.png',
    'lib/assets/cliente/FemaleAvatar7.png',
    'lib/assets/cliente/FemaleAvatar8.png',
    'lib/assets/cliente/FemaleAvatar12.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Seleccionar una imagen aleatoria según el género
    final String randomAvatar = cliente.genero.toLowerCase() == 'female'
        ? avatarFemaleImages[Random().nextInt(avatarFemaleImages.length)]
        : avatarMaleImages[Random().nextInt(avatarMaleImages.length)];

    return Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: InkWell(
        onTap: () {
          // Navegar a la página de detalle del cliente pasando el cliente y avatar
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
                    image: DecorationImage(
                      image: AssetImage(
                          randomAvatar), // Imagen aleatoria basada en género
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
              // Icono de favorito o VIP
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: cliente.bip
                          ? Colors.yellow
                          : Colors.grey, // Color según VIP
                    ),
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
