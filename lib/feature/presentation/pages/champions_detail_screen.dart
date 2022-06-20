import 'package:flutter/material.dart';
import 'package:lol_champions/feature/presentation/widgets/champion_info_widget.dart';

class ChampionDetailScreen extends StatelessWidget {
  final String champion;

  const ChampionDetailScreen({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    return ChampionInfo();
  }
}
