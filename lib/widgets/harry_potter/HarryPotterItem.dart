import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';
import 'package:flutter_application_1/classes/HarryPotterInfoPageArguments.dart';

class HarryPotterItem extends StatelessWidget {
  final Datum character;

  const HarryPotterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/harryPotterInfo',
            arguments: character, // Pasamos el objeto completo.
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(90),
                  image: DecorationImage(
                    image: NetworkImage(character.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(character.name),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}