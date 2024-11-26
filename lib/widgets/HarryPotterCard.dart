import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';
import 'package:flutter_application_1/helpers/house_colors.dart'; // Importa la función

class HarryPotterCard extends StatelessWidget {
  final Datum character;

  const HarryPotterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    // Colores según la casa o por defecto
    List<Color> houseColors = getHouseColors(character.house);

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: houseColors,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del personaje y nombre
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent, // Fondo transparente
                  backgroundImage: character.image.isNotEmpty
                      ? NetworkImage(character.image)
                      : null,
                  child: character.image.isEmpty
                      ? const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white, // Ícono visible sobre fondo gris
                        )
                      : null,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Detalles adicionales
            _buildDetailRow(Icons.house, 'Casa',
                houseValues.reverse[character.house] ?? "Sin casa"),
            _buildDetailRow(Icons.person, 'Actor', character.actor),
            _buildDetailRow(Icons.accessibility, 'Especie',
                ancestryValues.reverse[character.ancestry] ?? "Desconocido"),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 24.0, color: Colors.white),
          const SizedBox(width: 8.0),
          Text(
            '$label: $value',
            style: const TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
