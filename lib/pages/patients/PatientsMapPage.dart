import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/patients/PatientsMap.dart';

class PatientsMapPage extends StatelessWidget {
  const PatientsMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text("Mapa de Pacientes"),
=======
        backgroundColor: Colors.amber[500],
        title: const Text("Mapa de Pacientes"),
>>>>>>> origin/dev
      ),
      body: Center(
        child: FutureFetcher(
          url: "https://tup-labo-4-grupo-15.onrender.com/api/v1/patients",
          widget: (data) {
            return PatientsMap(data: data);
          },
        ),
      ),
    );
  }
}
