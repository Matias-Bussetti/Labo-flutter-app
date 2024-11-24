import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

class HarryPotterCard extends StatelessWidget {
  final Datum character;

  const HarryPotterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Colores según la casa
    List<Color> houseColors = _getHouseColors(character.house);

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
                  backgroundImage: NetworkImage(character.image),
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
                houseValues.reverse[character.house]!),
            _buildDetailRow(Icons.person, 'Actor', character.actor),
            _buildDetailRow(Icons.accessibility, 'Especie',
                ancestryValues.reverse[character.ancestry]!),
          ],
        ),
      ),
    );
  }

  List<Color> _getHouseColors(House house) {
    switch (house) {
      case House.GRYFFINDOR:
        return [Colors.red, Colors.amber];
      case House.SLYTHERIN:
        return [Colors.green, Colors.grey];
      case House.HUFFLEPUFF:
        return [Colors.yellow, Colors.black];
      case House.RAVENCLAW:
        return [Colors.blue, Colors.brown];
      default:
        return [Colors.white, Colors.white];
    }
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
