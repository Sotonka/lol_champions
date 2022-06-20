import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/common/app_colors.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';

import 'dart:async';

import 'package:lol_champions/feature/presentation/pages/champions_detail_screen.dart';
import 'package:lol_champions/feature/presentation/widgets/loading_indicator.dart';
import 'package:lol_champions/utilities/constants.dart';

import '../bloc/champion_info_cubit/champion_info_cubit.dart';
import '../bloc/champion_info_cubit/champion_info_state.dart';
import 'champion_info/champion_info_first.dart';

class ChampionInfo extends StatelessWidget {
  final String championName;
  ChampionInfo({super.key, required this.championName});
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionInfoCubit, ChampionInfoState>(
        builder: (context, state) {
      ChampionInfoEntity? champion = null;
      if (state is ChampionInfoLoading) {
        return LoadingIndicator();
      } else if (state is ChampionInfoLoaded) {
        champion = state.champion;
      } else if (state is ChampionInfoError) {
        return Text(
          state.message,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        );
      }
      if (champion != null) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  Constants.FULL_IMG_PATH + champion.id + '_0.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: PageView(
            controller: _controller,
            scrollDirection: Axis.vertical,
            children: [
              ChampionInfoFirst(
                champion: champion,
              ),
            ],
          ),
        );
      } else {
        return LoadingIndicator();
      }
    });
  }
}
