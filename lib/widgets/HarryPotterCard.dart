import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

class HarryPotterCard extends StatelessWidget {
  final HarryPotterCharacters character;

  const HarryPotterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado con la imagen del personaje
            Row(
              children: [
                CircleAvatar(
                  radius: 50, // Aumentamos el tamaño de la imagen
                  backgroundImage: NetworkImage(character.image),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 22.0, // Aumentamos el tamaño del nombre
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Información sobre la casa
            Row(
              children: [
                const Icon(Icons.house, size: 24.0), // Aumentamos el tamaño del icono
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Casa: ${character.house.displayName}', // Usamos displayName para la casa
                    style: const TextStyle(fontSize: 18.0), // Aumentamos el tamaño de texto
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Información sobre la especie
            Row(
              children: [
                const Icon(Icons.accessibility, size: 24.0),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Especie: ${character.species}', // Asegúrate de que el campo species esté lleno
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Información sobre el patronus
            Row(
              children: [
                const Icon(Icons.star, size: 24.0),
                const SizedBox(width: 8.0),
                Text(
                  'Patronus: ${character.patronus.displayName}', // Usamos displayName para patronus
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Información sobre el actor
            Row(
              children: [
                const Icon(Icons.movie, size: 24.0),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Actor: ${character.actor.isEmpty ? "Desconocido" : character.actor}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Información sobre la fecha de nacimiento
            Row(
              children: [
                const Icon(Icons.cake, size: 24.0),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Fecha de Nacimiento: ${character.dateOfBirth ?? "Desconocida"}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Información sobre el año de nacimiento
            Row(
              children: [
                const Icon(Icons.event, size: 24.0),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Año de Nacimiento: ${character.yearOfBirth ?? "Desconocido"}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Información adicional
            const Divider(),
            const SizedBox(height: 8.0),
            // Estado del personaje
            Row(
              children: [
                const Icon(Icons.check_circle, size: 24.0),
                const SizedBox(width: 8.0),
                Text(
                  'Estado: ${character.alive ? "Vivo" : "Fallecido"}',
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
