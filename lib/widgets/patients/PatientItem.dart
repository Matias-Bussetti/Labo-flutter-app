import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/classes/SinglePatientPageArguments.dart';
import 'package:flutter_application_1/pages/SinglePatientPage.dart';

class PatientItem extends StatelessWidget {
  final Patient patient;
  const PatientItem({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              SinglePatientPage.routeName,
              arguments: SinglePatientPageArguments(
                patient.id,
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(90),
                        image: DecorationImage(
                            image: NetworkImage(patient.picture.thumbnail),
                            fit: BoxFit.cover)),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${patient.name.first} ${patient.name.last}",
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(patient.email)),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue[200],
                          size: 20.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text("Ver más"),
                        )
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
