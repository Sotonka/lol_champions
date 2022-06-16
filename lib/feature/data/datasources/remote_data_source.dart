import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lol_champions/core/error/exception.dart';
import 'package:lol_champions/feature/data/models/champion_model.dart';

abstract class ChampionRemoteDataSource {
  Future<List<ChampionModel>> getAllChampions();
}

class ChampionRemoteDataSourceImpl implements ChampionRemoteDataSource {
  late final http.Client client;

  @override
  Future<List<ChampionModel>> getAllChampions() => _getChampionFromUrl('');

  Future<List<ChampionModel>> _getChampionFromUrl(String url) async {
    // print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final champions = json.decode(response.body);
      return (champions['results'] as List)
          .map((champion) => ChampionModel.fromJson(champion))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
