import 'package:flutter_application_1/classes/Patient.dart';

class PatientResponse {
  final List<Patient> patients;

  PatientResponse({required this.patients});

  factory PatientResponse.fromJson(Map<String, dynamic> json) {
    return PatientResponse(
      patients: List<Patient>.from(
          json['data'].map((patient) => Patient.fromJson(patient))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': patients.map((patient) => patient.toJson()).toList(),
    };
  }
}
