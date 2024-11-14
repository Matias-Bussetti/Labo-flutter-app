import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/preferences.dart';

class IsFavoriteIcon extends StatefulWidget {
  final String id;
  const IsFavoriteIcon({super.key, required this.id});

  @override
  State<IsFavoriteIcon> createState() => _IsFavoriteIconState();
}

class _IsFavoriteIconState extends State<IsFavoriteIcon> {
  late bool isFav = false;

  @override
  Widget build(BuildContext context) {
    // Favorite favorito = Preferences.getFav(widget.id);
    // print(favorito);
    return InkWell(
        onTap: () {
          print(widget.id);
          setState(() {
            isFav = !isFav;
          });
        },
        child: (isFav ? Icon(Icons.star) : Icon(Icons.star_border)));
  }
}
