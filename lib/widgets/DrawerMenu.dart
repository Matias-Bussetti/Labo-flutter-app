// ignore: unused_import
// ignore_for_file: use_super_parameters

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainRouter.dart';
import 'package:flutter_application_1/helpers/preferences.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {

  DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeaderAlternative(screenWidth: screenWidth),
          ...ListTile.divideTiles(
              context: context,
              tiles: MainRouter.routes
                  .map((route) => route.show
                      ? ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          dense: true,
                          minLeadingWidth: 25,
                          iconColor: Colors.blueGrey,
                          title: Text(route.title,
                              style:
                                  const TextStyle(fontFamily: 'FuzzyBubbles')),
                          leading: route.icon,
                          /* trailing: const Icon(Icons.arrow_right), */
                          onTap: () {
                            Navigator.pop(context);
                            //Navigator.pushReplacementNamed(context, item['route']!);
                            Navigator.pushNamed(context, route.path);
                          },
                        )
                      : null)
                  .whereType<ListTile>()
                  .toList())
        ],
      ),
    );
  }
}

class _DrawerHeaderAlternative extends StatefulWidget {
  final double screenWidth;
  const _DrawerHeaderAlternative({
    required this.screenWidth,
  });

  @override
  State<_DrawerHeaderAlternative> createState() =>
      _DrawerHeaderAlternativeState();
}

class _DrawerHeaderAlternativeState extends State<_DrawerHeaderAlternative> {
  bool darkMode = false;
  List<Offset> positions = [];
  late Timer timer;

  @override
  void initState() {
    super.initState();
    darkMode = Preferences.darkmode;
    positions = List.generate(30, (_) => getStartPosition());

    timer = Timer.periodic(const Duration(milliseconds: 1500), (_) {
      changePositions();
    });
  }

  Offset getRandomPosition() {
    return Offset(getRandomLeftPosition(), getRandomTopPosition(100));
  }

  Offset getStartPosition() {
    return Offset(widget.screenWidth * 0.5, -100);
  }

  void changePositions() {
    setState(() {
      positions = List.generate(30, (_) => getRandomPosition());
    });
  }

  getRandomTopPosition(int max) {
    return Random().nextDouble() * max;
  }

  getRandomLeftPosition() {
    return Random().nextDouble() * (widget.screenWidth * 0.8);
  }

  getRandomSide(int max) {
    return Random().nextDouble() * max;
  }

  getRandomColor() {
    return Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255), Random().nextDouble() * 1);
  }

  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<ThemeProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        setState(() {
          darkMode = !darkMode;
          Preferences.darkmode = darkMode;
          darkMode ? temaProvider.setDark() : temaProvider.setLight();
          // Cambiar posiciones al hacer tap
          changePositions();
        });
      },
      child: DrawerHeader(
        padding: EdgeInsets.zero,
        child: Stack(children: [
          ...List.generate(30, (index) {
            return AnimatedPositioned(
              duration:
                  const Duration(milliseconds: 1500), // Duración de la animación
              curve: Curves.easeInOut, // Curva de animación
              top: positions[index].dy,
              left: positions[index].dx,
              child: Container(
                width: getRandomSide(50),
                height: getRandomSide(50),
                decoration: BoxDecoration(
                  color: getRandomColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                transform: Matrix4.rotationZ(Random().nextDouble() * 1),
              ),
            );
          }),
        ]),
      ),
    );
  }
}
