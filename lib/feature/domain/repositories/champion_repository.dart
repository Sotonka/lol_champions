import 'package:dartz/dartz.dart';
import 'package:lol_champions/core/error/failure.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';

abstract class ChampionRepository {
  // содержит методы получения списка персонажей и поиска персонажей

  Future<Either<Failure, List<ChampionEntity>>> getAllPersons(int page);
  Future<Either<Failure, List<ChampionEntity>>> searchPerson(String query);
}
