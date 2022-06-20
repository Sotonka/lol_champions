import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lol_champions/core/error/failure.dart';
import 'package:lol_champions/core/usecases/usecase.dart';
import 'package:lol_champions/feature/domain/entities/champion_entity.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';
import 'package:lol_champions/feature/domain/repositories/champion_repository.dart';

class GetChampionInfo extends UseCase<ChampionInfoEntity, ChampionParams> {
  final ChampionInfoRepository championInfoRepository;

  GetChampionInfo(this.championInfoRepository);

  @override
  Future<Either<Failure, ChampionInfoEntity>> call(
      ChampionParams params) async {
    return await championInfoRepository.getChampionInfo(params.name);
  }
}

class ChampionParams extends Equatable {
  final String name;
  const ChampionParams({required this.name});

  @override
  List<Object?> get props => [name];
}
