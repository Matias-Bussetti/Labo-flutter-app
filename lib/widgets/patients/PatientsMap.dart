import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Patient.dart';
import 'package:flutter_application_1/widgets/patients/PatientAvatarItem.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PatientsMap extends StatelessWidget {
  final Map<String, dynamic> data;

  const PatientsMap({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    List<Patient> patients = Patient.listFromJson(data);

    List<Marker> markers = patients.map((patient) {
      return Marker(
        point: LatLng(
            double.parse(patient.location.coordinates.latitude),
            double.parse(patient.location.coordinates
                .longitude)), // Usa las coordenadas del paciente
        width: screenWidth * 0.2,

        height: screenWidth * 0.2,
        child: PatientAvatarItem(patient: patient), // Icono personalizado
      );
    }).toList();
    return FlutterMap(
      options: const MapOptions(
        initialCenter:
            LatLng(51.509364, -0.128928), // Center the map over London
        initialZoom: 1,
      ),
      children: [
        TileLayer(
          // Display map tiles from any source
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
          userAgentPackageName: 'com.example.app',
          // And many more recommended properties!
        ),
        RichAttributionWidget(
          // Include a stylish prebuilt attribution widget that meets all requirments
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => launchUrl(Uri.parse(
                  'https://openstreetmap.org/copyright')), // (external)
            ),
            // Also add images...
          ],
        ),
        MarkerLayer(
          markers: markers,
        ),
      ],
    );
  }

  launchUrl(Uri parse) {}
}
