import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Cliente.dart';
import 'package:flutter_application_1/classes/ClienteInfoPageArguments.dart';

class ClienteAvatarItem extends StatelessWidget {
  final Cliente cliente; // Usa Datum en lugar de Cliente

  const ClienteAvatarItem({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/cliente/buscar',
            arguments: ClienteInfoPageArguments(
              cliente.id,
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
