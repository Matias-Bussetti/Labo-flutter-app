import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/patients/PatientList.dart';
import 'package:flutter_application_1/widgets/patients/PatientMap.dart';

class PatientMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: Text("Mapa de Pacientes"),
      ),
      body: Container(child: PatientMap()),
    );
  }
}
