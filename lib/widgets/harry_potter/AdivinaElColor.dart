import 'dart:math';
import 'package:flutter/material.dart';

class AdivinaElColor extends StatefulWidget {
  const AdivinaElColor({super.key});

  @override
  _AdivinaElColorState createState() => _AdivinaElColorState();
}

class _AdivinaElColorState extends State<AdivinaElColor> {
  String casaActual = '';
  String rutaImagen = '';
  String mensaje = '¡Intenta adivinar el color de la casa!';
  List<Color> coloresFondo = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
  late Map<String, dynamic> casaActualData;

  final Map<String, dynamic> casas = {
    "Gryffindor": {
      "colors": [Colors.red],
      "image": 'lib/assets/images/gryffindor.png',
    },
    "Slytherin": {
      "colors": [Colors.green],
      "image": 'lib/assets/images/slytherin.png',
    },
    "Hufflepuff": {
      "colors": [Colors.yellow],
      "image": 'lib/assets/images/hufflepuff.png',
    },
    "Ravenclaw": {
      "colors": [Colors.blue],
      "image": 'lib/assets/images/ravenclaw.png',
    },
  };

  @override
  void initState() {
    super.initState();
    generarNuevaCasa();
  }

  void generarNuevaCasa() {
    List<String> nombresCasas = casas.keys.toList();
    casaActual = nombresCasas[Random().nextInt(nombresCasas.length)];
    casaActualData = casas[casaActual]!;
    setState(() {
      mensaje = '¡Intenta adivinar el color de la casa!';
      rutaImagen = '';
    });
  }

  void verificarRespuesta(Color colorSeleccionado) {
    if (casaActualData['colors'].contains(colorSeleccionado)) {
      setState(() {
        mensaje = '¡Correcto! ¡Es de $casaActual!';
        rutaImagen = casaActualData['image'];
      });
    } else {
      setState(() {
        mensaje = '¡Es difícil recordar el color! Seguí practicando.';
        rutaImagen = casaActualData['image'];
      });
    }
    Future.delayed(const Duration(seconds: 3), () {
      generarNuevaCasa();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adivina el Color de la Casa de Hogwarts'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: coloresFondo,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (rutaImagen.isNotEmpty)
              Image.asset(
                rutaImagen,
                height: 150,
              ),
            const SizedBox(height: 30),
            Text(
              casaActual,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Botones distribuidos simétricamente
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2, // Dos botones por fila
              crossAxisSpacing: 10, // Espaciado horizontal
              mainAxisSpacing: 10, // Espaciado vertical
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: casas.values
                  .map<Widget>((casa) => ElevatedButton(
                        onPressed: () => verificarRespuesta(casa['colors'][0]),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: casa['colors'][0],
                          padding: const EdgeInsets.all(20),
                          side: const BorderSide(
                            color: Colors.white, // Borde blanco
                            width: 2.0, // Ancho del borde
                          ),
                        ),
                        child: const SizedBox(), // Botón vacío porque solo muestra color
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
