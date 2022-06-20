import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/feature/presentation/bloc/champion_info_cubit/champion_info_cubit.dart';
import 'package:lol_champions/feature/presentation/widgets/champion_info_widget.dart';
import 'package:lol_champions/locator_service.dart';

class ChampionDetailScreen extends StatelessWidget {
  final String champion;

  const ChampionDetailScreen({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ChampionInfoCubit>(
              create: (context) =>
                  sl<ChampionInfoCubit>()..loadChampion(champion)),
        ],
        child: ChampionInfo(
          championName: 'Aatrox',
        ));
  }
}
