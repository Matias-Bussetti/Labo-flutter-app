import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/classes/PatientDescription.dart';
import 'package:flutter_application_1/classes/PatientResponse.dart';
import 'package:http/http.dart' as http;

class PatientDescriptionFetcher extends StatefulWidget {
  final String id;
  const PatientDescriptionFetcher({super.key, required this.id});

  @override
  State<PatientDescriptionFetcher> createState() =>
      _PatientDescriptionFetcherState();
}

class _PatientDescriptionFetcherState extends State<PatientDescriptionFetcher> {
  late Future<Patient> data;

  @override
  void initState() {
    super.initState();
    data = fetchData(); // Llamada a la API
  }

  Future<Patient> fetchData() async {
    final response = await http.get(Uri.parse(
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/patients/${widget.id}"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return PatientResponse.fromJson(data).patient;
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Patient>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          Patient patient = snapshot.data as Patient;
          return Patientdescription(patient: patient);
        } else {
          return Center(child: Text('No data found'));
        }
      },
    );
  }
}
