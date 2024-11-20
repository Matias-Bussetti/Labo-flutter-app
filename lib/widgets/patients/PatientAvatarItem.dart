import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/classes/PatientInfoPageArguments.dart';
import 'package:flutter_application_1/pages/patients/PatientInfoPage.dart';

class PatientAvatarItem extends StatelessWidget {
  final Patient patient;
  const PatientAvatarItem({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/paciente/id',
            arguments: PatientInfoPageArguments(
              patient.id,
            ),
          );
        },
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(290),
              image: DecorationImage(
                  image: NetworkImage(patient.picture.thumbnail),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
