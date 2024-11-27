import 'package:flutter/material.dart';

class CustomCardMarvelChars extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Widget? trailingIcon;
  final VoidCallback onTap;

  const CustomCardMarvelChars({
    super.key,
    required this.imageUrl,
    required this.title,
    this.trailingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network( // Acá hice esto porque la API tira una imagen por default re fea cuando no tiene imagen el PJ
                (imageUrl.isEmpty || imageUrl == 'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg')
                    ? 'https://wallpapers.com/images/hd/marvel-logo-in-red-background-3p16v5avq80km4ns.jpg'
                    : imageUrl,
                height: 150, 
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 109, 5, 5),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (trailingIcon != null) trailingIcon!,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
