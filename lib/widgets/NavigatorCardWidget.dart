import 'package:flutter/material.dart';

class NavigatorCardWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final String route;

  const NavigatorCardWidget(
      {super.key,
      required this.title,
      required this.route,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: icon,
                title: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
