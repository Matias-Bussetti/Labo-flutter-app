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

  List<String> favs = Preferences.favs;
  @override
  initState() {
    super.initState();
    print(favs.contains(widget.id));
    setState(() {
      isFav = favs.contains(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(favorito);
    return InkWell(
        onTap: () {
          print(Preferences.favs);
          Preferences.setFav = widget.id;
          setState(() {
            isFav = !isFav;
          });
        },
        child: (isFav ? const Icon(Icons.star) : const Icon(Icons.star_border)));
  }
}
