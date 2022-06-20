import 'package:flutter/material.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';

class ChampionInfoFirst extends StatelessWidget {
  final ChampionInfoEntity champion;

  const ChampionInfoFirst({Key? key, required this.champion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            champion.title.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          Text(
            champion.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      champion.tags[0],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      champion.info.difficulty.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: SingleChildScrollView(
                    child: Text(
                      champion.lore,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
