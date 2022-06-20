import 'package:dartz/dartz.dart';
import 'package:lol_champions/core/error/exception.dart';
import 'package:lol_champions/core/error/failure.dart';
import 'package:lol_champions/core/platform/network_info.dart';
import 'package:lol_champions/feature/data/datasources/info_remote_data_soure.dart';
import 'package:lol_champions/feature/data/models/champion_info_model.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';
import 'package:lol_champions/feature/domain/repositories/champion_repository.dart';

class ChampionInfoRepositoryImpl implements ChampionInfoRepository {
  final ChampionInfoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ChampionInfoRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ChampionInfoEntity>> getChampionInfo(
      String name) async {
    return await _getChampion(() {
      return remoteDataSource.getChampionInfo(name);
    });
  }

  Future<Either<Failure, ChampionInfoModel>> _getChampion(
      Future<ChampionInfoModel> Function() getChampion) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteChampion = await getChampion();
        return Right(remoteChampion);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
