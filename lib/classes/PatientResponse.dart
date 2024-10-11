import 'package:flutter_application_1/classes/Patient.dart';

class PatientResponse {
  final Patient patient;

  PatientResponse({required this.patient});

  factory PatientResponse.fromJson(Map<String, dynamic> json) {
    return PatientResponse(patient: Patient.fromJson(json['data']));
  }
}
