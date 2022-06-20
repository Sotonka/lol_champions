// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/core/error/failure.dart';
import 'package:lol_champions/feature/domain/usecases/get_champion_info.dart';
import 'package:lol_champions/feature/presentation/bloc/champion_info_cubit/champion_info_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
// const CONNECTION_FAILURE_MESSAGE = 'No Connection';

class ChampionInfoCubit extends Cubit<ChampionInfoState> {
  // юзкейс
  final GetChampionInfo getChampion;

  //
  ChampionInfoCubit({required this.getChampion}) : super(ChampionInfoEmpty());

  void loadChampion() async {
    if (state is ChampionInfoLoading) return;

    final currentState = state;

    if (currentState is ChampionInfoLoaded) {}

    final failureOrChampion = await getChampion(ChampionParams(name: ''));

    failureOrChampion.fold(
        (error) =>
            emit(ChampionInfoError(message: _mapFailureToMessage(error))),
        (result) {
      emit(ChampionInfoLoaded(result));
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
