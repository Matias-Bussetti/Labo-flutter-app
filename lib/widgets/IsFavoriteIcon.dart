import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/preferences.dart';

class IsFavoriteIcon extends StatefulWidget {
  final String id;
  final Color color; 
  final double size; 

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

  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    isFav = Preferences.favs.contains(widget.id);
    darkMode = Preferences.darkmode;
  }
  Color invertirColor(Color color) {
  return Color.fromARGB(
    color.alpha, 
    255 - color.red, 
    255 - color.green, 
    255 - color.blue, 
  );
}

  void toggleFavorite() {
    setState(() {
      isFav = !isFav;
    });
    Preferences.setFav = widget.id; 
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleFavorite,
      child: Icon(
        isFav ? Icons.star : Icons.star_border,
        color: darkMode ? invertirColor(widget.color) : widget.color,
        size: widget.size,
      ),
    );
  }
  
}

