import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom/FutureFetcher.dart';
import 'package:flutter_application_1/widgets/Clientes/ClientesList.dart';

class ClientesListPage extends StatelessWidget {
  const ClientesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 126, 185),
        title: const Text("Pantalla de Clientes"),
      ),
      body: Center(
        child: FutureFetcher(
          url: "https://tup-labo-4-grupo-15.onrender.com/api/v1/clientes",
          widget: (data) {
            return ClientesList(data: data);
          },
        ),
      ),
    );
  }
}
