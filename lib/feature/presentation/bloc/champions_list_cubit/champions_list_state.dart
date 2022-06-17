import 'package:equatable/equatable.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';

abstract class ChampionState extends Equatable {
  const ChampionState();

  @override
  List<Object?> get props => [];
}

//
class ChampionEmpty extends ChampionState {
  @override
  List<Object?> get props => [];
}

//
class ChampionLoading extends ChampionState {
  final List<ChampionEntity> oChampionsList;
  final bool isFirstFetch;

  const ChampionLoading(this.oChampionsList, {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oChampionsList];
}

//
class ChampionLoaded extends ChampionState {
  final List<ChampionEntity> championsList;

  const ChampionLoaded(this.championsList);

  @override
  List<Object?> get props => [championsList];
}

//
class ChampionError extends ChampionState {
  final String message;

  const ChampionError({required this.message});

  @override
  List<Object?> get props => [message];
}
