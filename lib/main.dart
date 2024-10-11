import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/pages/PatientPage.dart';
import 'package:flutter_application_1/pages/SinglePatientPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grupo 15',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Grupo 15'),
      routes: {
        '/patients': (context) => PatientPage(),
        SinglePatientPage.routeName: (context) => const SinglePatientPage(),
      },
    );
  }
}
