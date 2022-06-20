import 'package:dartz/dartz.dart';
import 'package:lol_champions/core/error/failure.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';

abstract class ChampionRepository {
  Future<Either<Failure, List<ChampionEntity>>> getAllChampions(
      int count, String type);
}

abstract class ChampionInfoRepository {
  Future<Either<Failure, ChampionInfoEntity>> getChampionInfo(String name);
}
