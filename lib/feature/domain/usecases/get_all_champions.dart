import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lol_champions/core/error/failure.dart';
import 'package:lol_champions/core/usecases/usecase.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';
import 'package:lol_champions/feature/domain/repositories/champion_repository.dart';

class GetAllChampions extends UseCaseNoP<List<ChampionEntity>> {
  final ChampionRepository championRepository;

  GetAllChampions(this.championRepository);

  /* @override
  Future<Either<Failure, List<ChampionEntity>>> call(
      PagePersonParams params) async {
    return await personRepository.getAllPersons(params.page);
  } */

  @override
  Future<Either<Failure, List<ChampionEntity>>> call() async {
    return await championRepository.getAllChampions();
  }
}

/* 
ЕСЛИ НУЖНА БУДЕТ ПАГИНАЦИЯ/ ПРОГРУЗКА СКРОЛЛОМ
class PageChampionParams extends Equatable {
  final int page;
  const PageChampionParams({required this.page});

  @override
  List<Object?> get props => [page];
}
 */