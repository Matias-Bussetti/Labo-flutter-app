import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/MarvelCharacters.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';

class MarvelCharacterDescription extends StatelessWidget {
  final Map<String, dynamic> data;

  const MarvelCharacterDescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    MarvelChars character = MarvelChars.fromJson(data["data"]);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenWidth,
            floating: false,
            pinned: true, 
            automaticallyImplyLeading: false, 
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 10), 
                child: Text(
                  character.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 1.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              background: Stack(
                children: [
                  Container(
                    height: screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        image: NetworkImage(character.thumbnail),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14.0,
                    right: 8.0,
                    child: IsFavoriteIcon(
                      id: character.name,
                      color: Colors.yellow,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                if (character.description.isNotEmpty)
                  RowData(
                    icon: Icons.description,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            character.description.isNotEmpty
                                ? character.description
                                : 'Sin descripción disponible.',
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (character.series.isNotEmpty)
                  RowData(
                    icon: Icons.tv,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: character.series
                                .map((serie) => Chip(
                                      label: Text(
                                        serie,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowData extends StatelessWidget {
  const RowData({
    super.key,
    required this.children,
    required this.icon,
  });

  final List<Widget> children;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.red[200],
            size: 35.0,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
