import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/classes.dart';
import 'package:flutter_application_1/helpers/house_colors.dart'; 

class HarryPotterInfoPage extends StatelessWidget {
  const HarryPotterInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibimos el personaje completo como argumento.
    final character = ModalRoute.of(context)!.settings.arguments as Datum;

    // Colores según la casa
    List<Color> houseColors = getHouseColors(character.house);

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
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.network(
                          character.image,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    )
                    : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'lib/assets/images/ministry_of_magic.png', // Imagen predeterminada
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.fitWidth, 
                          ),
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
