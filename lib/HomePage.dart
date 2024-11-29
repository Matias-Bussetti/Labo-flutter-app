import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainRouter.dart';
import 'package:flutter_application_1/widgets/NavigatorCardWidget.dart';
import 'package:flutter_application_1/widgets/DrawerMenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawer: const DrawerMenu(),
      body: Container(
        alignment: Alignment.topLeft,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(26, 24, 24, 24),
              child: const Text(
                "Home",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40, // Tamaño aproximado de un h3
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
          ],
        ),
      ),
    );
  }
}
