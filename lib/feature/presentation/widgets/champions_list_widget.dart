import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';
import 'package:lol_champions/feature/presentation/bloc/champions_list_cubit/champions_list_cubit.dart';
import 'package:lol_champions/feature/presentation/bloc/champions_list_cubit/champions_list_state.dart';
import 'dart:async';

import 'package:lol_champions/feature/presentation/pages/champions_detail_screen.dart';

class ChampionsList extends StatelessWidget {
  final scrollController = ScrollController();
  ChampionsList({Key? key}) : super(key: key);

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          // BlocProvider.of<ChampionCubit>(context).loadChampion();
          context.read<ChampionCubit>().loadChampion();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return BlocBuilder<ChampionCubit, ChampionState>(builder: (context, state) {
      List<ChampionEntity> champions = [];
      bool isLoading = false;

      if (state is ChampionLoading && state.isFirstFetch) {
        return _loadingIndicator();
      } else if (state is ChampionLoading) {
        champions = state.oChampionsList;
        isLoading = true;
      } else if (state is ChampionLoaded) {
        champions = state.championsList;
      } else if (state is ChampionError) {
        return Text(
          state.message,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        );
      }

      List<Widget> getList() {
        List<Widget> child = [];
        champions.forEach((champion) {
          String picName = champion.image.full;
          child.add(Container(
            child: Image.network(
                'http://ddragon.leagueoflegends.com/cdn/12.11.1/img/champion/${picName}'),
            padding: EdgeInsets.all(4.0),
          ));
        });
        return child;
      }

      return GridView.builder(
        controller: scrollController,
        itemCount: champions.length + (isLoading ? 7 : 0),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          if (index < champions.length) {
            String picName = champions[index].image.full;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChampionDetailScreen(champion: champions[index].id),
                    ));
              },
              child: Container(
                child: Image.network(
                    'http://ddragon.leagueoflegends.com/cdn/12.11.1/img/champion/${picName}'),
                padding: EdgeInsets.all(4.0),
              ),
            );
          } else {
            Timer(Duration(milliseconds: 30), () {
              /* scrollController
                  .jumpTo(scrollController.position.maxScrollExtent); */
            });
            return _loadingIndicator();
          }
        },
      );
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
