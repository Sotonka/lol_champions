import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lol_champions/core/error/exception.dart';
import 'package:lol_champions/feature/data/models/champion_info_model.dart';
import 'package:lol_champions/feature/data/models/champion_model.dart';
import 'package:lol_champions/feature/domain/usecases/get_champion_info.dart';
import 'package:lol_champions/utilities/constants.dart';

abstract class ChampionInfoRemoteDataSource {
  Future<ChampionInfoModel> getChampionInfo(String name);
}

class ChampionInfoRemoteDataSourceImpl implements ChampionInfoRemoteDataSource {
  final http.Client client;

  ChampionInfoRemoteDataSourceImpl({required this.client});

  @override
  Future<ChampionInfoModel> getChampionInfo(String name) =>
      _getChampionFromUrl('${Constants.PATH}', name);

  Future<ChampionInfoModel> _getChampionFromUrl(String url, String name) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final championInfo = json.decode(response.body);

      return championInfo['data'][name];
    } else {
      throw ServerException();
    }
  }
}
