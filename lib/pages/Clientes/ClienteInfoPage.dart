
import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/ClienteInfoPageArguments.dart';
import 'package:flutter_application_1/widgets/Clientes/ClienteDescription.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';

class ClienteInfoPage extends StatefulWidget {
  const ClienteInfoPage({
    super.key,
  });

  @override
  State<ClienteInfoPage> createState() => _ClienteInfoPageState();
}

class _ClienteInfoPageState extends State<ClienteInfoPage> {
  @override
  Widget build(BuildContext context) {
    // Extraer los argumentos de la ModalRoute actual
    // y castear como ClienteInfoPageArguments.
    final args =
        ModalRoute.of(context)!.settings.arguments as ClienteInfoPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle del Cliente"),
      ),
      body: Center(
        child: FutureFetcher(
          url:
              "https://tup-labo-4-grupo-15.onrender.com/api/v1/clientes/buscar?id=${args.id}",
          widget: (data) {
            return ClienteDescription(data: data);
          },
        ),
      ),
    );
  }
}
