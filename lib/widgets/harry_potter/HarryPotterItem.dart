import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';
import 'package:flutter_application_1/helpers/house_colors.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart'; // El widget compartido
import 'package:flutter_application_1/helpers/preferences.dart'; // Para manejar el tema

class HarryPotterItem extends StatelessWidget {
  final Datum character;

  const HarryPotterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final houseColors = getHouseColors(character.house); // Colores por casa
    bool darkMode = Preferences.darkmode; // Detecta el tema actual

    // Color dinámico del ícono de favorito
    Color favoriteIconColor = darkMode ? Colors.red : const Color.fromARGB(255, 88, 80, 4); // Rojo en dark, amarillo en light

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: houseColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: character.image.isNotEmpty
              ? NetworkImage(character.image)
              : const AssetImage('lib/assets/images/ministry_of_magic.png') as ImageProvider,
          radius: 30,
        ),
        title: Text(
          character.name,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          houseValues.reverse[character.house] ?? 'Sin casa',
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Material(
          elevation: 5.0, // Elevación para la sombra
          shadowColor: Colors.black.withOpacity(0.5), // Color de la sombra
          shape: CircleBorder(), // Forma circular de la sombra
          child: Container(
            padding: const EdgeInsets.all(4.0), // Espacio entre el ícono y la sombra
            child: IsFavoriteIcon(
              id: character.id.toString(),
              color: favoriteIconColor, // Pasamos el color dinámico del ícono
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/harryPotterInfo',
            arguments: character,
          );
        },
      ),
    );
  }
}
