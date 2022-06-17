import 'dart:convert';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lol_champions/core/error/exception.dart';
import 'package:lol_champions/feature/data/models/champion_model.dart';
import 'package:lol_champions/utilities/constants.dart';

/* abstract class ChampionRemoteDataSource {
  Future<List<ChampionModel>> getAllChampions();
}

class ChampionRemoteDataSourceImpl implements ChampionRemoteDataSource {
  final http.Client client;

  ChampionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ChampionModel>> getAllChampions() =>
      _getChampionFromUrl('${Constants.PATH}');

  Future<List<ChampionModel>> _getChampionFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final champions = json.decode(response.body);
      var list = [];
      champions['data'].forEach((k, v) => list.add(v));

      return (list as List)
          .map((champion) => ChampionModel.fromJson(champion))
          .toList();
    } else {
      throw ServerException();
    }
  }
}  */

// тест на JSON файле
abstract class ChampionRemoteDataSource {
  Future<List<ChampionModel>> getAllChampions();
}

class ChampionRemoteDataSourceImpl implements ChampionRemoteDataSource {
  final http.Client client;

  ChampionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ChampionModel>> getAllChampions() => _getChampionFromUrl();

  Future<List<ChampionModel>> _getChampionFromUrl() async {
    final champions =
        json.decode(await rootBundle.loadString('lib/test/champions.json'));

    var list = [];

    champions['data'].forEach((k, v) => list.add(v));

    //var paginationList = list.getRange();
    List<dynamic> paginationList = list.skip(0).take(28).toList();
    return (paginationList)
        .map((champion) => ChampionModel.fromJson(champion))
        .toList();
  }
}
