import 'package:dartz/dartz.dart';
import 'package:lol_champions/core/error/exception.dart';
import 'package:lol_champions/core/error/failure.dart';
import 'package:lol_champions/core/platform/network_info.dart';
import 'package:lol_champions/feature/data/datasources/remote_data_source.dart';
import 'package:lol_champions/feature/data/models/champion_model.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';
import 'package:lol_champions/feature/domain/repositories/champion_repository.dart';

class ChampionRepositoryImpl implements ChampionRepository {
  final ChampionRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ChampionRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ChampionEntity>>> getAllChampions() async {
    return await _getChampions(() {
      return remoteDataSource.getAllChampions();
    });
  }

  Future<Either<Failure, List<ChampionModel>>> _getChampions(
      Future<List<ChampionModel>> Function() getChampions) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteChampion = await getChampions();
        return Right(remoteChampion);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
