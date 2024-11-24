import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

class HarryPotterInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recibimos el personaje completo como argumento.
    final character = ModalRoute.of(context)!.settings.arguments as Datum;

    // Colores según la casa
    List<Color> houseColors = _getHouseColors(character.house);

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: houseColors[0],
      ),
      body: Container(
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
            // Imagen grande del personaje
            Center(
              child: character.image.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        character.image,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Icon(Icons.person, size: 100, color: Colors.grey),
                    ),
            ),
            const SizedBox(height: 16.0),
            // Detalles del personaje
            _buildDetailRow(Icons.account_circle, 'Nombre', character.name),
            _buildDetailRow(
              Icons.house,
              'Casa',
              houseValues.reverse[character.house] ?? 'Desconocida',
            ),
            _buildDetailRow(
              Icons.accessibility,
              'Ancestry',
              ancestryValues.reverse[character.ancestry] ?? 'Desconocido',
            ),
            _buildDetailRow(Icons.person, 'Actor', character.actor),
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
