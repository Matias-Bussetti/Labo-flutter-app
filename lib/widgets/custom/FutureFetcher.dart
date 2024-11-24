import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureFetcher extends StatefulWidget {
  final String url;
  final Widget Function(dynamic) widget; // Cambiar Map<String, dynamic> a dynamic para aceptar List o Map.

  const FutureFetcher({
    Key? key,
    required this.url,
    required this.widget,
  }) : super(key: key);

  @override
  _FutureFetcherState createState() => _FutureFetcherState();
}

class _FutureFetcherState extends State<FutureFetcher> {
  late Future<dynamic> data; // Cambiar Map<String, dynamic> a dynamic.

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

    Future<dynamic> fetchData() async {
      final response = await http.get(Uri.parse(widget.url));

        if (response.statusCode == 200) {
          print(response.body); // <-- Agrega esta línea para revisar el JSON que devuelve la API
           return jsonDecode(response.body);
        } else {
           throw Exception('Error fetching data');
        }
    }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return widget.widget(snapshot.data); // Pasamos los datos tal cual al widget.
        } else {
          return Center(child: Text('No data found'));
        }
      },
    );
  }
}
