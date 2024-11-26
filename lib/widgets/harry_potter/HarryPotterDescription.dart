import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

class HarryPotterDescription extends StatelessWidget {
  final Datum data; // Representa un personaje individual

  const HarryPotterDescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Determinamos los colores del degradado según la casa
    List<Color> houseColors = _getHouseColors(data.house);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: houseColors,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.1),
      ),
      child: Column(
        children: [
          // Imagen o ícono si no hay imagen
          if (data.image.isNotEmpty) ...[
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data.image),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ] else ...[
            Container(
              height: 250,
              alignment: Alignment.center,
              color: Colors.grey[700], // Fondo gris para ausencia de imagen
              child: const Icon(
                Icons.person,
                size: 100,
                color: Colors.white,
              ),
            ),
          ],
          RowData(
            icon: Icons.account_circle,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  data.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          RowData(
            icon: Icons.house,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Casa: ${houseValues.reverse[data.house] ?? "Sin casa"}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          RowData(
            icon: Icons.accessibility,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Especie: ${data.ancestry}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          RowData(
            icon: Icons.star,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Actor: ${data.actor}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Función para obtener los colores del degradado según la casa
  List<Color> _getHouseColors(House? house) {
    if (house == null) {
      return _getDefaultColors(); // Degradado gris por defecto
    }
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
        return _getDefaultColors();
    }
  }

  // Colores por defecto
  List<Color> _getDefaultColors() {
    return [Colors.grey[700]!, Colors.grey[400]!];
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
          Icon(
            icon,
            color: Colors.blue[200],
            size: 35.0,
          ),
          const SizedBox(width: 8.0),
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
