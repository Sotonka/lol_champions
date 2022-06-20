import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';

import 'dart:async';

import 'package:lol_champions/feature/presentation/pages/champions_detail_screen.dart';

import '../bloc/champion_info_cubit/champion_info_cubit.dart';
import '../bloc/champion_info_cubit/champion_info_state.dart';

class ChampionInfo extends StatelessWidget {
  final scrollController = ScrollController();
  ChampionInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionInfoCubit, ChampionInfoState>(
        builder: (context, state) {
      late ChampionInfoEntity champion;
      bool isLoading = false;

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

      return Text(champion.id);
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
