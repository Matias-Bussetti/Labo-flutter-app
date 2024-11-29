import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/Pokemon.dart';
import 'package:flutter_application_1/widgets/IsFavoriteIcon.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: InkWell(
          onTap: () {
            // Navigator.pushNamed(
            //   context,
            //   '/paciente/id',
            //   arguments: PokemonInfoPageArguments(
            //     pokemon.id,
            //   ),
            // );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(90),
                      // image: DecorationImage(
                      //     image: NetworkImage(pokemon.thumbnail),
                      //     fit: BoxFit.cover)
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${pokemon.name}",
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("tipo")),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 0,
                    child: Row(
                      children: [IsFavoriteIcon(id: 'pokemon-${pokemon.id}')],
                    )),
              ],
            ),
          )),
    );
  }
}
