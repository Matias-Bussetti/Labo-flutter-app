import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Cliente.dart';
import 'package:flutter_application_1/classes/ClienteInfoPageArguments.dart';

class ClienteAvatarItem extends StatelessWidget {
  final Cliente cliente; // Usa Datum en lugar de Cliente

  const ClienteAvatarItem({Key? key, required this.cliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/cliente/buscar',
            arguments: ClienteInfoPageArguments(
              cliente.id, // Accede al 'id' de Datum directamente
            ),
          );
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(290),
          ),
        ),
      ),
    );
  }
}
