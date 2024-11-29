import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/classes/classes.dart';
import 'package:flutter_application_1/widgets/search/HarryPotterSearchDelegate.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';

class HarryPotterListPage extends StatefulWidget {
  const HarryPotterListPage({super.key});

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
        title: const Text("Lista de Personajes de Harry Potter"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
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
        url: "https://tup-labo-4-grupo-15.onrender.com/api/v1/todoslospersonajes", // URL de la API
        widget: (data) {
          if (data['data'] is List) {
            characters = List<Datum>.from(
              data['data'].map((item) => Datum.fromJson(item)),
            );

            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: character.image.isNotEmpty
                        ? NetworkImage(character.image)
                        : const AssetImage('lib/assets/images/ministry_of_magic.png') as ImageProvider, 
                  
                  ),
                  title: Text(character.name),
                  subtitle: Text(houseValues.reverse[character.house] ?? 'Sin casa'),
                  trailing: IsFavoriteIcon(id: character.id.toString(), color: const Color.fromARGB(255, 212, 212, 0)), // Ícono de favorito
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
            return const Center(child: Text("Error al cargar los personajes."));
          }
        },
      ),
    );
  }
}
