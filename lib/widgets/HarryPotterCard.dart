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
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(character.image),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    character.name,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Icon(Icons.house, size: 20.0),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text('Casa: ${character.house}', style: const TextStyle(fontSize: 16.0)),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.accessibility, size: 20.0),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text('Especie: ${character.species}', style: const TextStyle(fontSize: 16.0)),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.star, size: 20.0),
                const SizedBox(width: 8.0),
                Text('Patronus: ${character.patronus}', style: const TextStyle(fontSize: 16.0)),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
