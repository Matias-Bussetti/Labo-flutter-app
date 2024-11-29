import 'package:flutter/material.dart';

class NavigatorCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final String route;

  const NavigatorCardWidget(
      {super.key,
      required this.title,
      required this.route,
      required this.icon,
      required this.subtitle});

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
                subtitle: subtitle == ""
                    ? null
                    : Row(
                        children: [
                          const Icon(Icons.person),
                          Text(subtitle),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
