import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainRouter.dart';
import 'package:flutter_application_1/widgets/NavigatorCardWidget.dart';
import 'package:flutter_application_1/widgets/DrawerMenu.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: DrawerMenu(),
      body: Container(
        alignment: Alignment.topLeft,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(26, 30, 24, 24),
              child: Row(
                children: [
                  Icon(Icons.app_shortcut_sharp),
                  const Text(
                    "  Home",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 40, // Tamaño aproximado de un h3
                      fontStyle: FontStyle.italic, // Aplicar cursiva
                      fontWeight: FontWeight
                          .w600, // Un poco más grueso para darle énfasis
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(26, 10, 0, 0),
              child: const Text(
                "Integrantes del Grupo:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25, // Tamaño aproximado de un h3
                  fontStyle: FontStyle.italic, // Aplicar cursiva
                  fontWeight:
                      FontWeight.w600, // Un poco más grueso para darle énfasis
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(34, 10, 0, 0),
              child: Row(
                children: [
                  Icon(Icons.woman),
                  Text(
                    " Eugenia Losada",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20, // Tamaño aproximado de un h3
                      fontStyle: FontStyle.italic, // Aplicar cursiva
                      fontWeight: FontWeight
                          .w300, // Un poco más grueso para darle énfasis
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(34, 10, 0, 0),
              child: Row(
                children: [
                  Icon(Icons.man_3_sharp),
                  Text(
                    " Diego Bruno",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20, // Tamaño aproximado de un h3
                      fontStyle: FontStyle.italic, // Aplicar cursiva
                      fontWeight: FontWeight
                          .w300, // Un poco más grueso para darle énfasis
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(34, 10, 0, 0),
              child: Row(
                children: [
                  Icon(Icons.man_3_sharp),
                  Text(
                    " Juan Chaparro",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20, // Tamaño aproximado de un h3
                      fontStyle: FontStyle.italic, // Aplicar cursiva
                      fontWeight: FontWeight
                          .w300, // Un poco más grueso para darle énfasis
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(34, 10, 0, 0),
              child: Row(
                children: [
                  Icon(Icons.man_3_sharp),
                  Text(
                    " Eric Ponin",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20, // Tamaño aproximado de un h3
                      fontStyle: FontStyle.italic, // Aplicar cursiva
                      fontWeight: FontWeight
                          .w300, // Un poco más grueso para darle énfasis
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(34, 10, 0, 10),
              child: Row(
                children: [
                  Icon(Icons.man_3_sharp),
                  Text(
                    " Matias Bussetti",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20, // Tamaño aproximado de un h3
                      fontStyle: FontStyle.italic, // Aplicar cursiva
                      fontWeight: FontWeight
                          .w300, // Un poco más grueso para darle énfasis
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(26, 10, 0, 10),
              child: const Text(
                "Contenidos de la App:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25, // Tamaño aproximado de un h3
                  fontStyle: FontStyle.italic, // Aplicar cursiva
                  fontWeight:
                      FontWeight.w600, // Un poco más grueso para darle énfasis
                ),
              ),
            ),
            ...MainRouter.routes
                .map((route) => route.show
                    ? NavigatorCardWidget(
                        title: route.title,
                        route: route.path,
                        icon: route.icon,
                        subtitle: route.subtitle,
                      )
                    : null)
                .whereType<Widget>()
                .toList()
          ],
        ),
      ),
    );
  }
}
