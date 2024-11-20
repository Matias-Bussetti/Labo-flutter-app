import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class SpidermanCatchGame extends StatefulWidget {
  const SpidermanCatchGame({super.key});

  @override
  State<SpidermanCatchGame> createState() => _SpidermanCatchGameState();
}

class _SpidermanCatchGameState extends State<SpidermanCatchGame> {
  double spidermanX = 0.0; // Posición de Spider-Man
  double spidermanY = 0.8; // Posición fija un poco más arriba
  double villainX = 0.0; // Posición horizontal del villano
  double villainY = -1.0; // Posición vertical del villano
  int score = 0; // Puntaje del jugador
  bool isGameRunning = false;

  void startGame() {
    isGameRunning = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!isGameRunning) {
        timer.cancel();
        return;
      }

      setState(() {
        villainY += 0.05; // El villano cae más abajo

        if (villainY > 1.0) {
          // El villano toca el suelo
          isGameRunning = false;
          showGameOverDialog();
        } else if ((villainY > spidermanY - 0.1 && villainY < spidermanY + 0.1) &&
            (villainX - spidermanX).abs() < 0.2) {
          // Spider-Man atrapa al villano
          score++;
          resetVillain();
        }
      });
    });
  }

  void resetVillain() {
    setState(() {
      villainX = Random().nextDouble() * 2 - 1; // Nueva posición aleatoria
      villainY = -1.0; // Reinicia la altura del villano
    });
  }

  void moveSpiderMan(String direction) {
    if (!isGameRunning) startGame();
    setState(() {
      if (direction == 'left' && spidermanX > -1.0) {
        spidermanX -= 0.2; // Mueve a la izquierda
      } else if (direction == 'right' && spidermanX < 1.0) {
        spidermanX += 0.2; // Mueve a la derecha
      }
    });
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('¡Game Over!'),
          content: Text('Tu puntaje: $score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  score = 0;
                  spidermanX = 0.0;
                  resetVillain();
                  isGameRunning = false;
                });
              },
              child: const Text('Reintentar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Salir al menú
              },
              child: const Text('Salir'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spider-Man: Atrapá a Venom'),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white, // Fondo blanco
      body: Stack(
        children: [
          // Villano
          AnimatedContainer(
            alignment: Alignment(villainX, villainY),
            duration: const Duration(milliseconds: 0),
            child: Image.asset(
              'lib/assets/images/venom.png',
              width: 75, // Tamaño 50% más grande
              height: 75, // Tamaño 50% más grande
            ),
          ),
          // Spider-Man
          AnimatedContainer(
            alignment: Alignment(spidermanX, spidermanY),
            duration: const Duration(milliseconds: 0),
            child: Image.asset(
              'lib/assets/images/spiderman.png',
              width: 105, // Tamaño 50% más grande
              height: 105, // Tamaño 50% más grande
            ),
          ),
          // Controles de movimiento
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => moveSpiderMan('left'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20), // Botones más grandes
                  ),
                  child: const Icon(
                    Icons.arrow_left,
                    size: 40, // Iconos más grandes
                  ),
                ),
                ElevatedButton(
                  onPressed: () => moveSpiderMan('right'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20), // Botones más grandes
                  ),
                  child: const Icon(
                    Icons.arrow_right,
                    size: 40, // Iconos más grandes
                  ),
                ),
              ],
            ),
          ),
          // Puntaje
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Puntaje: $score',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
