import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/patients/PatientDescription.dart';
import 'package:flutter_application_1/widgets/patients/PatientDescriptionFetcher.dart';
import 'package:flutter_application_1/classes/PatientResponse.dart';
import 'package:flutter_application_1/classes/SinglePatientPageArguments.dart';

class SinglePatientPage extends StatefulWidget {
  const SinglePatientPage({
    super.key,
  });

  @override
  State<SinglePatientPage> createState() => _SinglePatientPageState();
}

class _SinglePatientPageState extends State<SinglePatientPage> {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments
        as SinglePatientPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Paciente"),
      ),
      body: Center(
        child: FutureFetcher(
          url:
              "https://tup-labo-4-grupo-15.onrender.com/api/v1/patients/${args.id}",
          fromJson: PatientResponse.fromJson,
          snapShotWidget: Patientdescription,
        ),
      ),
    );
  }
}
