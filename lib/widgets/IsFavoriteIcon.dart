import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/preferences.dart';

class IsFavoriteIcon extends StatefulWidget {
  final String id;
  final Color color; // Color del ícono
  final double size; // Tamaño del ícono

  const IsFavoriteIcon({
    super.key,
    required this.id,
    this.color = Colors.white,
    this.size = 24,
  });

  @override
  State<IsFavoriteIcon> createState() => _IsFavoriteIconState();
}

class _IsFavoriteIconState extends State<IsFavoriteIcon> {
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = Preferences.favs.contains(widget.id);
  }

  void toggleFavorite() {
    setState(() {
      isFav = !isFav;
    });
    Preferences.setFav = widget.id; // Esto debe manejar el agregar/remover
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleFavorite,
      child: Icon(
        isFav ? Icons.star : Icons.star_border,
        color: widget.color,
        size: widget.size,
      ),
    );
  }
}

