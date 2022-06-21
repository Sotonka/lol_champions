import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';
import 'package:lol_champions/feature/presentation/widgets/champion_info/champion_info_second.dart';
import 'package:lol_champions/feature/presentation/widgets/champion_info/champion_info_third.dart';
import 'dart:async';
import 'package:lol_champions/feature/presentation/widgets/loading_indicator.dart';
import 'package:lol_champions/utilities/constants.dart';
import '../bloc/champion_info_cubit/champion_info_cubit.dart';
import '../bloc/champion_info_cubit/champion_info_state.dart';
import 'champion_info/champion_info_first.dart';

class ChampionInfo extends StatefulWidget {
  final String championName;
  ChampionInfo({super.key, required this.championName});

  @override
  State<ChampionInfo> createState() => _ChampionInfoState();
}

class _ChampionInfoState extends State<ChampionInfo> {
  final _controller = PageController();

  double opacityLevel = 1.0;

  NetworkImage? bgImage = null;

  void _changeOpacity() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() => opacityLevel = 0.45);
  }

  @override
  void initState() {
    _changeOpacity();
    super.initState();
  }

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
        return Stack(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 1500),
              opacity: opacityLevel,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        '${Constants.FULL_IMG_PATH}${champion.id}_0.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            PageView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: [
                ChampionInfoFirst(
                  champion: champion,
                ),
                ChampionInfoSecond(
                  champion: champion,
                ),
                ChampionInfoThird(
                  champion: champion,
                )
              ],
            ),
          ],
        );
      } else {
        return LoadingIndicator();
      }
    });
  }
}
