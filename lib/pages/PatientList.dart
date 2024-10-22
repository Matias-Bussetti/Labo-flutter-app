import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/classes/PatientsResponse.dart';
import 'package:flutter_application_1/pages/PatientItem.dart';
import 'package:flutter_application_1/widgets/PatientCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Patientlist extends StatefulWidget {
  const Patientlist({super.key});

  @override
  State<Patientlist> createState() => _PatientlistState();
}

class _PatientlistState extends State<Patientlist> {
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
    var screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<List<dynamic>>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<Patient> patients = snapshot.data as List<Patient>;
          List<Marker> markers = patients.map((patient) {
            return Marker(
              point: LatLng(
                  double.parse(patient.location.coordinates.latitude),
                  double.parse(patient.location.coordinates
                      .longitude)), // Usa las coordenadas del paciente
              width: screenWidth * 0.2,

              height: screenWidth * 0.2,
              child: PatientItem(patient: patient), // Icono personalizado
            );
          }).toList();
          return FlutterMap(
            options: MapOptions(
              initialCenter:
                  LatLng(51.509364, -0.128928), // Center the map over London
              initialZoom: 1,
            ),
            children: [
              TileLayer(
                // Display map tiles from any source
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                userAgentPackageName: 'com.example.app',
                // And many more recommended properties!
              ),
              RichAttributionWidget(
                // Include a stylish prebuilt attribution widget that meets all requirments
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () => launchUrl(Uri.parse(
                        'https://openstreetmap.org/copyright')), // (external)
                  ),
                  // Also add images...
                ],
              ),
              MarkerLayer(
                markers: markers,
              ),
            ],
          );
        } else {
          return Center(child: Text('No data found'));
        }
      },
    );
  }

  launchUrl(Uri parse) {}
}
