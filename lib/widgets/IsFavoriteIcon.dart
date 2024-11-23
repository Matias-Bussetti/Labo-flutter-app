import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/preferences.dart';

class IsFavoriteIcon extends StatefulWidget {
  final String id;
  final Color color; // Nuevo parámetro para el color del ícono

  const IsFavoriteIcon({super.key, required this.id, this.color = Colors.white}); // Color por defecto

  @override
  State<IsFavoriteIcon> createState() => _IsFavoriteIconState();
}

class _IsFavoriteIconState extends State<IsFavoriteIcon> {
  late bool isFav = false;

  List<String> favs = Preferences.favs;

  @override
  void initState() {
    super.initState();
    setState(() {
      isFav = favs.contains(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Preferences.setFav = widget.id;
        setState(() {
          isFav = !isFav;
        });
      },
      child: Icon(
        isFav ? Icons.star : Icons.star_border,
        color: widget.color, // Aplicar el color al ícono
      ),
    );
  }
}
