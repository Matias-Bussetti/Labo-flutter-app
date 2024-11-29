import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/classes/PatientsResponse.dart';
import 'package:flutter_application_1/widgets/patients/PatientItem.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PatientsList extends StatefulWidget {
  const PatientsList({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  State<PatientsList> createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  late List<Patient> _patients;

  Timer? _debounce; // declaro el debounce para el timer
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _patients = Patient.listFromJson(widget.data);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel(); // libero el timer
    super.dispose();
  }

  void _handleSearch(String value) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 2000), () async {
      if (value.isEmpty) {
        setState(() {
          _patients = Patient.listFromJson(widget.data);
        });
      } else {
        try {
          List<Patient> results = await fetchData(value.toLowerCase());
          setState(() {
            _patients = results;
          });
        } catch (error) {
          // Manejar el error aquí (opcional)
          print('Error fetching data: $error');
        }
      }
    });
  }

  Future<List<Patient>> fetchData(value) async {
    final response = await http.get(Uri.parse(
        "https://tup-labo-4-grupo-15.onrender.com/api/v1/patients/where?name=${value}"));

    print(response);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      return Patient.listFromJson(jsonData);
    } else {
      throw Exception('Error fetching data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: SizedBox(
            height: 45,
            width: 360,
            child: TextField(
              onChanged: _handleSearch,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar por Nombre (minimo 2 car.)",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _patients.length,
              itemBuilder: (BuildContext context, int index) {
                Patient patient = _patients[index];
                return PatientItem(patient: patient);
              }),
        ),
      ],
    );
  }
}
