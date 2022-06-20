import 'package:equatable/equatable.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';

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
  const ChampionLoading();

  @override
  List<Object?> get props => [];
}

//
class ChampionLoaded extends ChampionState {
  final ChampionInfoEntity champion;

  const ChampionLoaded(this.champion);

  @override
  List<Object?> get props => [champion];
}

//
class ChampionError extends ChampionState {
  final String message;

  const ChampionError({required this.message});

  @override
  List<Object?> get props => [message];
}
