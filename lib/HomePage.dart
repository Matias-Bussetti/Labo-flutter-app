import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CardWidget.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CardWidget(
                title: "Pacientes",
                subtitle: "Ir a pacientes",
                route: "/patients",
                buttonText: "Ir")
          ],
        ),
      ),
    );
  }
}
