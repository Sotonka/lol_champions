import 'package:equatable/equatable.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';

abstract class ChampionInfoState extends Equatable {
  const ChampionInfoState();

  @override
  List<Object?> get props => [];
}

//
class ChampionInfoEmpty extends ChampionInfoState {
  @override
  List<Object?> get props => [];
}

//
class ChampionInfoLoading extends ChampionInfoState {
  const ChampionInfoLoading();

  @override
  List<Object?> get props => [];
}

//
class ChampionInfoLoaded extends ChampionInfoState {
  final ChampionInfoEntity champion;

  const ChampionInfoLoaded(this.champion);

  @override
  List<Object?> get props => [champion];
}

//
class ChampionInfoError extends ChampionInfoState {
  final String message;

  const ChampionInfoError({required this.message});

  @override
  List<Object?> get props => [message];
}
