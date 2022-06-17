import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';
import 'package:lol_champions/feature/presentation/bloc/champions_list_cubit/champions_list_cubit.dart';
import 'package:lol_champions/feature/presentation/bloc/champions_list_cubit/champions_list_state.dart';

class ChampionsList extends StatelessWidget {
  const ChampionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionCubit, ChampionState>(builder: (context, state) {
      List<ChampionEntity> champions = [];

      if (state is ChampionLoading) {
        return _loadingIndicator();
      } else if (state is ChampionLoaded) {
        champions = state.championsList;
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

      return GridView.count(
        crossAxisCount: 4,
        children: getList(),
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
