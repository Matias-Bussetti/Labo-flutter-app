import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';
import 'package:flutter_application_1/widgets/search/HarryPotterSearchDelegate.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';

class HarryPotterListPage extends StatefulWidget {
  @override
  _HarryPotterListPageState createState() => _HarryPotterListPageState();
}

class _HarryPotterListPageState extends State<HarryPotterListPage> {
  List<Datum> characters = []; // Lista de personajes cargados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: Text("Lista de Personajes de Harry Potter"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              if (characters.isNotEmpty) {
                showSearch(
                  context: context,
                  delegate: HarryPotterSearchDelegate(characters),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Datos aún no cargados.")),
                );
              }
            },
          ),
        ],
      ),
      body: FutureFetcher(
        url: "https://tup-labo-4-grupo-15.onrender.com/api/v1/personajes", // URL de la API
        widget: (data) {
          if (data is Map<String, dynamic> && data['data'] is List) {
            characters = List<Datum>.from(
              data['data'].map((item) => Datum.fromJson(item)),
            );

            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(character.image),
                  ),
                  title: Text(character.name),
                  subtitle: Text(houseValues.reverse[character.house] ?? 'Sin casa'),
                  trailing: IsFavoriteIcon(id: character.id.toString(), color: Color.fromARGB(255, 212, 212, 0)), // Ícono de favorito
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/harryPotterInfo',
                      arguments: character,
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text("Error al cargar los personajes."));
          }
        },
      ),
    );
  }
}
