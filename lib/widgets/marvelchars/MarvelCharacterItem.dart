import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';

class MarvelCharacterItem extends StatelessWidget {
  final MarvelChars character;

  const MarvelCharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/marvelchars/id',
          arguments: character,
        );
      },
      child: GridTile(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 0.0,
              ),
            ],
          ),
          child: Column(
            children: [
              // Imagen del personaje
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0),
                child: Image.network(
                  character.thumbnail,
                  fit: BoxFit.cover, // Imagen ajustada al contenedor
                  height: 150, // Tamaño de la imagen para que quepan dos por fila
                  width: double.infinity, // Ocupa todo el ancho disponible
                ),
              ),
              const SizedBox(height: 8), // Espacio entre la imagen y el nombre
              // Nombre del personaje
              Text(
                character.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomMarvelCharacterGrid extends StatelessWidget {
  final List<MarvelChars> characters;

  const CustomMarvelCharacterGrid({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (characters.isEmpty) {
      return const Center(
        child: Text("No se encontraron resultados."),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Dos elementos por fila
        crossAxisSpacing: 8, // Espaciado horizontal entre elementos
        mainAxisSpacing: 8, // Espaciado vertical entre elementos
        childAspectRatio: 0.8, // Ajuste para que la imagen y el texto encajen
      ),
      itemCount: characters.length,
      itemBuilder: (BuildContext context, int index) {
        MarvelChars character = characters[index];
        return MarvelCharacterItem(character: character); // Usa el widget modificado aquí
      },
    );
  }
}

