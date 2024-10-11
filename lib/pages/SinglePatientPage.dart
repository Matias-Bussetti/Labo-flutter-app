import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/classes/PatientResponse.dart';
import 'package:flutter_application_1/classes/SinglePatientPageArguments.dart';

class SinglePatientPage extends StatefulWidget {
  const SinglePatientPage({
    super.key,
  });

  static const routeName = '/paciente/id';

  @override
  State<SinglePatientPage> createState() => _SinglePatientPageState();
}

class _SinglePatientPageState extends State<SinglePatientPage> {
  late Future<List<dynamic>> data;

  get http => null;

  @override
  void initState() {
    super.initState();
    data = fetchData() as Future<List>; // Llamada a la API
  }

  Future<Patient> fetchData() async {
    final response = await http.get(
        Uri.parse("https://tup-labo-4-grupo-15.onrender.com/api/v1/patients"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return PatientResponse.fromJson(data).patient;
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments
        as SinglePatientPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Paciente"),
      ),
      body: Center(
        child: Text(args.id),
      ),
    );
  }
}
