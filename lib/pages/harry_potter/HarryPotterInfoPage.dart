import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';
import 'package:flutter_application_1/widgets/harry_potter/HarryPotterDescription.dart';

class HarryPotterInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recibimos el personaje completo como argumento.
    final character = ModalRoute.of(context)!.settings.arguments as HarryPotterCharacters;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: HarryPotterDescription(data: character), // Pasamos el personaje a la descripción.
    );
  }
}

