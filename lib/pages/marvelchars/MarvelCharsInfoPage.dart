import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';

class MarvelCharsInfoPage extends StatelessWidget {
  const MarvelCharsInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtén los argumentos desde el ModalRoute
    final character = ModalRoute.of(context)!.settings.arguments as MarvelChars;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del personaje que ocupa todo el ancho sin modificar la relación de aspecto
              Container(
                width: double.infinity, // Ocupa todo el ancho disponible
                child: Image.network(
                  character.thumbnail,
                  fit: BoxFit.fitWidth, // La imagen se ajusta para ocupar todo el ancho, manteniendo la relación de aspecto
                ),
              ),
              const SizedBox(height: 16),

              // Nombre del personaje centrado
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 105, 105, 105),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    character.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Descripción del personaje
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 83, 83, 83),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  character.description.isNotEmpty
                      ? 'Descripción: ${character.description}'
                      : 'Sin descripción disponible',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 16),

              // Fecha de modificación
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 102, 102, 102),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  'Última modificación: ${character.modified}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 16),

              // Series en las que aparece el personaje (todas dentro de una misma caja gris)
              if (character.series.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 83, 83, 83), // Gris común
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Series:',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      for (var series in character.series)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            series,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
