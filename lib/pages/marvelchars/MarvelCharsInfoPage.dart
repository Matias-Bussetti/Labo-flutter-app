import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';
import 'package:flutter_application_1/classes/MarvelCharactersInfoPageArguments.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/marvelchars/MarvelCharacterDescription.dart'; // La descripción personalizada para los personajes Marvel

class MarvelCharsInfoPage extends StatefulWidget {
  const MarvelCharsInfoPage({super.key});

  @override
  State<MarvelCharsInfoPage> createState() => _MarvelCharsInfoPageState();
}

class _MarvelCharsInfoPageState extends State<MarvelCharsInfoPage> {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    final MarvelChars character = ModalRoute.of(context)!.settings.arguments as MarvelChars;

    return Scaffold(
      appBar: AppBar(
        title: Text("Personaje de Marvel"),
      ),
      body: Center(
        child: FutureFetcher(
          url: "https://tup-labo-4-grupo-15.onrender.com/api/v1/marvel/chars/${character.id}", // URL a la API de Marvel
          widget: (data) {
            return MarvelCharacterDescription(data: data); // Aquí se pasa la información obtenida
          },
        ),
      ),
    );
  }
}

