import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureFetcher extends StatefulWidget {
  final String url;
  final Widget Function(List<dynamic>?) snapShotWidget;
  final Function fromJson;

  const FutureFetcher({
    Key? key,
    required this.url,
    required this.snapShotWidget,
    required this.fromJson,
  }) : super(key: key);

  @override
  _FutureFetcherState createState() => _FutureFetcherState();
}

class _FutureFetcherState extends State<FutureFetcher> {
  late Future<List<dynamic>> data;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(widget.url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      return widget.fromJson(jsonData);
    } else {
      throw Exception('Error fetching data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return widget.snapShotWidget(snapshot.data);
        } else {
          return Center(child: Text('No data found'));
        }
      },
    );
  }
}
