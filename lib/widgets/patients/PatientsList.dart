import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/widgets/patients/PatientItem.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _patients = Patient.listFromJson(widget.data);
    });
  }

  void _handleSearch(String value) {
    setState(() {
      if (value.isEmpty) {
        _patients = Patient.listFromJson(widget.data);
      } else {
        _patients = Patient.listFromJson(widget.data)
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar por Nombre",
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
