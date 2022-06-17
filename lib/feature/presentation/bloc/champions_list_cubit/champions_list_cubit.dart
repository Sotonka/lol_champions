// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/core/error/failure.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';
import 'package:lol_champions/feature/domain/usecases/get_all_champions.dart';
import 'package:lol_champions/feature/presentation/bloc/champions_list_cubit/champions_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
// const CONNECTION_FAILURE_MESSAGE = 'No Connection';

class ChampionCubit extends Cubit<ChampionState> {
  // юзкейс
  final GetAllChampions getChampions;

  //
  ChampionCubit({required this.getChampions}) : super(ChampionEmpty());

  int count = 28;

  void loadChampion() async {
    if (state is ChampionLoading) return;

    final currentState = state;

    var oChampion = <ChampionEntity>[];

    if (currentState is ChampionLoaded) {
      oChampion = currentState.championsList;
    }
    emit(ChampionLoading(oChampion));

    final failureOrChampion =
        await getChampions(ChampionParams(count: count, type: ''));

    failureOrChampion.fold(
        (error) => emit(ChampionError(message: _mapFailureToMessage(error))),
        (result) {
      count += 28;
      final champions = (state as ChampionLoading).oChampionsList;

      champions.addAll(result);
      emit(ChampionLoaded(champions));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      /* case ConnectionFailure:
        return CONNECTION_FAILURE_MESSAGE; */

      default:
        return 'Unexpected Error';
    }
  }
}
