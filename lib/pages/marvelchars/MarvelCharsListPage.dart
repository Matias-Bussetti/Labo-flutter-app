import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/marvelchars/MarvelCharactersList.dart';

class MarvelCharsListPage extends StatelessWidget {
  const MarvelCharsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: const Text("Lista de personajes de Marvel"),
      ),
      body: Center(
        child: FutureFetcher(
          url: "https://tup-labo-4-grupo-15.onrender.com/api/v1/marvel/chars?limit=20&offset=0",
          widget: (data) {
            return MarvelCharactersList(data: data);
          },
        ),
      ),
    );
  }
}