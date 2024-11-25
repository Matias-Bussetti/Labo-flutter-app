import 'package:flutter_application_1/classes/Cliente.dart';

class ClienteResponse {
  final Cliente cliente;

  ClienteResponse({required this.cliente});

  factory ClienteResponse.fromJson(Map<String, dynamic> json) {
    return ClienteResponse(cliente: Cliente.fromJson(json['data']));
  }

  Map<String, dynamic> toJson() {
    return {
      'data': cliente.toJson(),
    };
  }
}
