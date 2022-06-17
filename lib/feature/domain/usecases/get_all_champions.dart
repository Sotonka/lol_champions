import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lol_champions/core/error/failure.dart';
import 'package:lol_champions/core/usecases/usecase.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';
import 'package:lol_champions/feature/domain/repositories/champion_repository.dart';

class GetAllChampions extends UseCase<List<ChampionEntity>, ChampionParams> {
  final ChampionRepository championRepository;

  GetAllChampions(this.championRepository);

  @override
  Future<Either<Failure, List<ChampionEntity>>> call(
      ChampionParams params) async {
    return await championRepository.getAllChampions(params.count, params.type);
  }
}

class ChampionParams extends Equatable {
  final int count;
  final String type;
  const ChampionParams({required this.count, required this.type});

  @override
  List<Object?> get props => [count, type];
}
