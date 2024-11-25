import 'package:flutter_application_1/classes/Cliente.dart';

class ClientesResponse {
  final List<Cliente> clientes;

  ClientesResponse({required this.clientes});

  factory ClientesResponse.fromJson(Map<String, dynamic> json) {
    return ClientesResponse(
      clientes: List<Cliente>.from(
          json['data'].map((cliente) => Cliente.fromJson(cliente))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': clientes.map((cliente) => cliente.toJson()).toList(),
    };
  }

  List<Cliente> getData() {
    return clientes;
  }
}
