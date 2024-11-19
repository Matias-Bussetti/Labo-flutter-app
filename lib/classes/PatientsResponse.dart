import 'package:flutter_application_1/classes/Patient.dart';

class PatientsResponse {
  final List<Patient> patients;

  PatientsResponse({required this.patients});

  factory PatientsResponse.fromJson(Map<String, dynamic> json) {
    return PatientsResponse(
      patients: List<Patient>.from(
          json['data'].map((patient) => Patient.fromJson(patient))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': patients.map((patient) => patient.toJson()).toList(),
    };
  }

  List<Patient> getData() {
    return this.patients;
  }
}
