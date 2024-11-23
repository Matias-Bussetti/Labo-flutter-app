import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/marvelchars/MarvelCharactersList.dart';

class MarvelCharsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: Text("Marvel - Lista de Personajes"),
      ),
      body: Center(
        child: FutureFetcher(
          url: "https://tup-labo-4-grupo-15.onrender.com/api/v1/marvel/chars/all",
          widget: (data) {
            return MarvelCharactersList(data: data);
          },
        ),
      ),
    );
  }
}