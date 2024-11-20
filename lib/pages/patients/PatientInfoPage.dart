
import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/classes/PatientInfoPageArguments.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/patients/PatientDescription.dart';
import 'package:flutter_application_1/classes/PatientResponse.dart';

class PatientInfoPage extends StatefulWidget {
  const PatientInfoPage({
    super.key,
  });

  @override
  State<PatientInfoPage> createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args =
        ModalRoute.of(context)!.settings.arguments as PatientInfoPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Paciente"),
      ),
      body: Center(
        child: FutureFetcher(
          url:
              "https://tup-labo-4-grupo-15.onrender.com/api/v1/patients/${args.id}",
          widget: (data) {
            return Patientdescription(data: data);
          },
        ),
      ),
    );
  }
}
