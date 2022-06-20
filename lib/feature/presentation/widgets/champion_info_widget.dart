import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';

import 'dart:async';

import 'package:lol_champions/feature/presentation/pages/champions_detail_screen.dart';

import '../bloc/champion_info_cubit/champion_info_cubit.dart';
import '../bloc/champion_info_cubit/champion_info_state.dart';

class ChampionInfo extends StatelessWidget {
  final String championName;
  const ChampionInfo({super.key, required this.championName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionInfoCubit, ChampionInfoState>(
        builder: (context, state) {
      /*      ChampionInfoEntity champion = ChampionInfoEntity(
          id: '',
          name: '',
          title: '',
          image: ImageEntity(full: 'full', sprite: 'sprite', group: 'group'),
          tags: [],
          skins: [],
          lore: 'lore',
          allytips: [],
          enemytips: [],
          partype: 'partype',
          info: InfoEntity(attack: 1, defense: 1, magic: 1, difficulty: 1),
          spells: [],
          passive: PassiveEntity(
              name: 'name',
              description: 'description',
              image:
                  ImageEntity(full: 'full', sprite: 'sprite', group: 'group'))); */
      ChampionInfoEntity? champion = null;
      if (state is ChampionInfoLoading) {
        return _loadingIndicator();
      } else if (state is ChampionInfoLoaded) {
        champion = state.champion;
      } else if (state is ChampionInfoError) {
        return Text(
          state.message,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        );
      }
      if (champion != null) {
        return Text(champion.id);
      } else {
        return _loadingIndicator();
      }
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
