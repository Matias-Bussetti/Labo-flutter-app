import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainRouter.dart';
import 'package:flutter_application_1/helpers/preferences.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  final List<Map<String, String>> _menuItems = <Map<String, String>>[
    {'route': 'home', 'title': 'Home', 'subtitle': 'Home + counter app'},
    {'route': 'design', 'title': 'Diseños', 'subtitle': 'Estructura y diseño'},
    {'route': 'listview_builder', 'title': 'Listview Builder', 'subtitle': ''},
    {
      'route': 'listview_separated',
      'title': 'Listview Separated',
      'subtitle': ''
    },
    {'route': 'list_card', 'title': 'Listview Cards', 'subtitle': ''},
    {
      'route': 'animated_container',
      'title': 'Animated Cointainer',
      'subtitle': ''
    },
    {'route': 'counter', 'title': 'Counter', 'subtitle': ''},
    {'route': 'flexbox', 'title': 'Ejemplos de Flexbox', 'subtitle': ''},
    {'route': 'swipper_card', 'title': 'Card Swipper', 'subtitle': ''},
    {'route': 'alert', 'title': 'Alertas', 'subtitle': ''},
    {'route': 'stack', 'title': 'Stack', 'subtitle': ''},
    {'route': 'infinite_scroll', 'title': 'Scroll Infinito', 'subtitle': ''},
    {'route': 'custom_list', 'title': 'Custom list', 'subtitle': ''},
    {'route': 'material_library', 'title': 'Material Library', 'subtitle': ''},
    {'route': 'profile', 'title': 'Perfil usuario', 'subtitle': ''},
    {
      'route': 'provider_navigation_bar',
      'title': 'Bottom Navigation',
      'subtitle': 'Manejo con SetState'
    },
    {
      'route': 'provider_navigation_bar_provider',
      'title': 'Bottom Navigation',
      'subtitle': '(Provider demo)'
    },
    {
      'route': 'list_people',
      'title': 'Lista Mock Api',
      'subtitle': '(Provider)'
    },
  ];

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
    super.key,
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
