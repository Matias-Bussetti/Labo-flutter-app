import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/PatientList.dart';

class PatientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: Text("Pantalla de Pacientes"),
      ),
      body: Container(child: Patientlist()),
    );
  }
}
