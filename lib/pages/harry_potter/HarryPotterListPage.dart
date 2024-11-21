import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/harry_potter/HarryPotterList.dart';
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
              final characters = data
                  .map((item) => HarryPotterCharacters.fromJson(item))
                  .toList();

              return HarryPotterList(characters: characters); // Usamos el nuevo widget con búsqueda.
            } else {
              return Center(child: Text("Error: Los datos no son una lista válida"));
            }
          },
        ),
      ),
    );
  }
}
