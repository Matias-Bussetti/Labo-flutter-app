import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/preferences.dart';

class IsFavoriteIcon extends StatefulWidget {
  final String id;
  final Color color;
  final double size; // Nuevo parámetro para el color del ícono

  const IsFavoriteIcon(
      {super.key,
      required this.id,
      this.color = Colors.white,
      this.size = 24}); // Color por defecto

  @override
  State<IsFavoriteIcon> createState() => _IsFavoriteIconState();
}

class _IsFavoriteIconState extends State<IsFavoriteIcon> {
  late bool isFav = false;

  List<String> favs = Preferences.favs;
  @override
  initState() {
    super.initState();
    setState(() {
      isFav = favs.contains(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print(Preferences.favs);
          Preferences.setFav = widget.id;
          setState(() {
            isFav = !isFav;
          });
        },
        child:
            (isFav ? const Icon(Icons.star) : const Icon(Icons.star_border)));
  }
}
