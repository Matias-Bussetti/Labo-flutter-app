import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatear fechas
import 'package:flutter_application_1/classes/Patient.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    // Formatear la fecha de nacimiento
    DateTime dobDate = DateTime.parse(patient.dob.date);
    String formattedDate = DateFormat.yMMMMd().format(dobDate);

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado con la imagen y el nombre
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(patient.picture.thumbnail),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    '${patient.name.title} ${patient.name.first} ${patient.name.last}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Información Básica
            Row(
              children: [
                const Icon(Icons.email, size: 20.0),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    patient.email,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            Row(
              children: [
                const Icon(Icons.person, size: 20.0),
                const SizedBox(width: 8.0),
                Text(
                  'Género: ${patient.gender}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            Row(
              children: [
                const Icon(Icons.cake, size: 20.0),
                const SizedBox(width: 8.0),
                Text(
                  'Fecha de Nacimiento: $formattedDate',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Información de Ubicación
            const Divider(),
            const SizedBox(height: 8.0),
            const Text(
              'Ubicación',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),

            Row(
              children: [
                const Icon(Icons.location_on, size: 20.0),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    '${patient.location.street.number} ${patient.location.street.name}, ${patient.location.city}, ${patient.location.state}, ${patient.location.country}, ${patient.location.postcode}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            Row(
              children: [
                const Icon(Icons.map, size: 20.0),
                const SizedBox(width: 8.0),
                Text(
                  'Coordenadas: ${patient.location.coordinates.latitude}, ${patient.location.coordinates.longitude}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            Row(
              children: [
                const Icon(Icons.access_time, size: 20.0),
                const SizedBox(width: 8.0),
                Text(
                  'Zona Horaria: ${patient.location.timezone.description} (${patient.location.timezone.offset})',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Información Adicional
            const Divider(),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const SizedBox(width: 8.0),
                Text(
                  'ID: ${patient.id}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            Row(
              children: [
                const Icon(Icons.flag, size: 20.0),
                const SizedBox(width: 8.0),
                Text(
                  'Nacionalidad: ${patient.nat}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
