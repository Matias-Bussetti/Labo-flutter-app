import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/HarryPotterCharacters.dart';

class HarryPotterDescription extends StatelessWidget {
  final Datum data;  // Cambié el tipo a Datum, ya que estamos pasando un personaje individual

  const HarryPotterDescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          if (data.image.isNotEmpty) ...[
            Container(
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                image: DecorationImage(
                  image: NetworkImage(data.image),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
          RowData(
            icon: Icons.account_circle,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${data.name}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          RowData(
            icon: Icons.house,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Casa: ${houseValues.reverse[data.house]}'), // Usamos reverse para obtener el nombre de la casa
             
              ),
            ],
          ),
          RowData(
            icon: Icons.accessibility,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Especie: ${data.ancestry}'),
              ),
            ],
          ),
          RowData(
            icon: Icons.star,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Actor: ${data.actor}'),
              ),
            ],
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
      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue[200],
            size: 35.0,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
