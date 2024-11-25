import 'package:flutter/material.dart';

class CustomCardMarvelChars extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Widget? trailingIcon;
  final VoidCallback onTap;

  const CustomCardMarvelChars({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.trailingIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0, // Sombras para dar efecto de profundidad
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagen en la parte superior de la Card
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                imageUrl.isNotEmpty
                    ? imageUrl
                    : 'https://wallpapers.com/images/hd/marvel-logo-in-red-background-3p16v5avq80km4ns.jpg',
                height: 150, // Altura de la imagen
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Información en la parte inferior de la Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 187, 187, 187),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Título (nombre del personaje)
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Icono (opcional)
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

