import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/classes/PatientsResponse.dart';
import 'package:flutter_application_1/widgets/patients/PatientItem.dart';
import 'package:flutter_application_1/widgets/PatientCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientList extends StatefulWidget {
  const PatientList({
    super.key,
    required this.patients,
  });

  final List<Patient> patients;

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  late List<Patient> _patients;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _patients = widget.patients;
    });
  }

  void _handleSearch(String value) {
    setState(() {
      if (value.isEmpty) {
        _patients = widget.patients;
      } else {
        _patients = widget.patients
            .where((patient) =>
                (patient.name.first.toLowerCase())
                    .contains(value.toLowerCase()) ||
                (patient.name.last.toLowerCase()).contains(value.toLowerCase()))
            .toList();
      }
    });
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
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar por Nombre",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
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
