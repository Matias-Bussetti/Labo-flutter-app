import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/classes/PatientsResponse.dart';
import 'package:flutter_application_1/widgets/patients/PatientItem.dart';
import 'package:flutter_application_1/widgets/PatientCard.dart';
import 'package:flutter_application_1/widgets/patients/PatientList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientListFetcher extends StatefulWidget {
  const PatientListFetcher({super.key});

  @override
  State<PatientListFetcher> createState() => _PatientListFetcherState();
}

class _PatientListFetcherState extends State<PatientListFetcher> {
  late Future<List<dynamic>> data;

  @override
  void initState() {
    super.initState();
    data = fetchData(); // Llamada a la API
  }

  Future<List<Patient>> fetchData() async {
    final response = await http.get(
        Uri.parse("https://tup-labo-4-grupo-15.onrender.com/api/v1/patients"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return PatientsResponse.fromJson(data).patients;
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<Patient> patients = snapshot.data as List<Patient>;
          return PatientList(patients: patients);
        } else {
          return Center(child: Text('No data found'));
        }
      },
    );
  }
}
