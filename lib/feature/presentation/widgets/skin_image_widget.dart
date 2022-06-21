import 'package:flutter/material.dart';
import 'package:lol_champions/utilities/constants.dart';

class SkinWidget extends StatelessWidget {
  final String name;
  final int id;
  final String champion;

  const SkinWidget(
      {super.key,
      required this.name,
      required this.id,
      required this.champion});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  NetworkImage('${Constants.FULL_IMG_PATH}${champion}_$id.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                textAlign: TextAlign.center,
                name.toUpperCase(),
                style: const TextStyle(
                  color: Color.fromARGB(150, 255, 255, 255),
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
