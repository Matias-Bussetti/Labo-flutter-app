import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/harry_potter/HarryPotterItem.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

class HarryPotterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: Text("Lista de Personajes de Harry Potter"),
      ),
      body: Center(
        child: FutureFetcher(
          url: "https://hp-api.herokuapp.com/api/characters", // URL de la API
          widget: (data) {
            if (data is List) {
              final characters = data.map((item) => HarryPotterCharacters.fromJson(item)).toList();

              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return HarryPotterItem(character: character); // Pasamos el personaje al widget.
                },
              );
            } else {
              return Center(child: Text("Error: Los datos no son una lista válida"));
            }
          },
        ),
      ),
    );
  }
}
