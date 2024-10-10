import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String route;
  final String buttonText;

  const CardWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.route,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text(buttonText),
                  onPressed: () {
                    Navigator.pushNamed(context, route);
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
