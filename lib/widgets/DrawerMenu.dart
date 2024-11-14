import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainRouter.dart';

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

class _DrawerHeaderAlternative extends StatelessWidget {
  final double screenWidth;
  const _DrawerHeaderAlternative({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  getRandomTopPosition(int max) {
    return Random().nextDouble() * max;
  }

  getRandomLeftPosition() {
    return Random().nextDouble() * (screenWidth * 0.8);
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
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Stack(children: [
        for (int i = 0; i < 30; i++)
          Positioned(
            top: getRandomTopPosition(100),
            left: getRandomLeftPosition(),
            child: Container(
              width: getRandomSide(50),
              height: getRandomSide(50),
              decoration: BoxDecoration(

                  // color: Colors.blueAccent.withOpacity(0.5),
                  color: getRandomColor(),
                  borderRadius: BorderRadius.circular(10)),
              transform: Matrix4.rotationZ(Random().nextDouble() * 1),
            ),
          ),
      ]),
    );
  }
}
