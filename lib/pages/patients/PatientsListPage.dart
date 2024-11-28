import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/patients/PatientsList.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text("Pantalla de Pacientes"),
=======
        backgroundColor: Colors.amber[500],
        title: const Text("Pantalla de Pacientes"),
>>>>>>> origin/dev
      ),
      body: Center(
        child: FutureFetcher(
          url: "https://tup-labo-4-grupo-15.onrender.com/api/v1/patients",
          widget: (data) {
            return PatientsList(data: data);
          },
        ),
      ),
    );
  }
}
