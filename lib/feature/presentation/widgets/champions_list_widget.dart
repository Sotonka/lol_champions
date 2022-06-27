import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/common/app_colors.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';
import 'package:lol_champions/feature/presentation/bloc/champions_list_cubit/champions_list_cubit.dart';
import 'package:lol_champions/feature/presentation/bloc/champions_list_cubit/champions_list_state.dart';
import 'dart:async';
import 'package:lol_champions/feature/presentation/pages/champions_detail_screen.dart';
import 'package:lol_champions/feature/presentation/widgets/image_widget.dart';
import 'package:lol_champions/feature/presentation/widgets/loading_indicator.dart';
import 'package:lol_champions/utilities/constants.dart';

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
        return LoadingIndicator();
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

      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            color: AppColors.mainColor,
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: const Text(
                            'All',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: const Text(
                            'Assassins',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: const Text(
                            'Fighters',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: const Text(
                            'Marksmen',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: const Text(
                            'Mages',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: const Text(
                            'Supports',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: const Text(
                            'Tanks',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              controller: scrollController,
              itemCount: champions.length + (isLoading ? 7 : 0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                if (index < champions.length) {
                  String picName = champions[index].image.full;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChampionDetailScreen(
                                champion: champions[index].id),
                          ));
                    },
                    child: ChampionImage(
                        height: 48.0,
                        width: 48.0,
                        imageUrl: Constants.IMG_PATH + 'champion/' + picName),
                  );
                } else {
                  Timer(Duration(milliseconds: 30), () {
                    /* scrollController
                        .jumpTo(scrollController.position.maxScrollExtent); */
                  });
                  return LoadingIndicator();
                }
              },
            ),
          ),
        ],
      );
    });
  }
}
