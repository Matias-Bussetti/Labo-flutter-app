import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Patientdescription extends StatelessWidget {
  final List<dynamic> data;
  const Patientdescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    Patient patient = data as Patient;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      // padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: screenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                // borderRadius: BorderRadius.circular(90),
                image: DecorationImage(
                    alignment: Alignment.center,
                    image: NetworkImage(patient.picture.large),
                    fit: BoxFit.fitHeight)),
          ),
          RowData(
            icon: patient.gender == "male" ? Icons.male : Icons.female,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${patient.name.title} ${patient.name.first} ${patient.name.last} ",
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft, child: Text(patient.email)),
            ],
          ),
          RowData(
            icon: Icons.map,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${patient.location.country}, ${patient.location.state}, ${patient.location.city}",
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "${patient.location.street.name} ${patient.location.street.name} (${patient.location.postcode})"),
              ),
            ],
          ),
          RowData(
            icon: Icons.date_range_outlined,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Edad: ${patient.dob.age}",
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Fecha Nacimiento: ${DateTime.parse(patient.dob.date)}",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  launchUrl(Uri parse) {}
}

class RowData extends StatelessWidget {
  const RowData({
    super.key,
    required this.children,
    required this.icon,
  });

  final List<Widget> children;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        children: [
          Expanded(
              flex: 0,
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.blue[200],
                    size: 35.0,
                  ),
                ],
              )),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  children: children,
                ),
              )),
        ],
      ),
    );
  }
}
