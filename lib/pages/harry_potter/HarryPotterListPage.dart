import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/classes/HarryPotterResponse.dart';
import 'package:flutter_application_1/widgets/harry_potter/HarryPotterItem.dart';
import 'package:flutter_application_1/widgets/search/HarryPotterSearchDelegate.dart';
import 'package:flutter_application_1/helpers/preferences.dart'; // Importa para detectar dark mode

class HarryPotterListPage extends StatefulWidget {
  const HarryPotterListPage({super.key});

  @override
  _HarryPotterListPageState createState() => _HarryPotterListPageState();
}

class _HarryPotterListPageState extends State<HarryPotterListPage> {
  @override
  Widget build(BuildContext context) {
    bool darkMode = Preferences.darkmode; // Detecta modo oscuro

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkMode ? Colors.black : Colors.blueAccent, // Ajuste de color
        title: Text(
          "Lista de Personajes de Harry Potter",
          style: TextStyle(
            color: darkMode ? Colors.redAccent : Colors.white, // Color dinámico
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: darkMode ? Colors.redAccent : Colors.white,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: HarryPotterSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: FutureFetcher(
        url: "https://tup-labo-4-grupo-15.onrender.com/api/v1/todoslospersonajes",
        widget: (data) {
          final response = HarryPotterResponse.fromJson(data);

          return ListView.builder(
            itemCount: response.characters.length,
            itemBuilder: (context, index) {
              final character = response.characters[index];
              return HarryPotterItem(character: character);
            },
          );
        },
      ),
    );
  }
}
