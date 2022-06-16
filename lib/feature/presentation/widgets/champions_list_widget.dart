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
      return ListView.separated(
        itemBuilder: (context, index) {
          return Text('${champions[index]}');
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: champions.length,
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
