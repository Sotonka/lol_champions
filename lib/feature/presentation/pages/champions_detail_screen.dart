import 'package:flutter/material.dart';

class ChampionDetailScreen extends StatelessWidget {
  final String champion;

  const ChampionDetailScreen({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(champion),
    );
  }
}
