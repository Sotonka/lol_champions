import 'package:flutter/material.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';
import 'package:lol_champions/feature/presentation/widgets/skin_image_widget.dart';

class ChampionInfoThird extends StatelessWidget {
  final ChampionInfoEntity champion;

  const ChampionInfoThird({Key? key, required this.champion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    List<SkinWidget> skins = [];

    champion.skins.forEach((element) {
      skins.add(SkinWidget(
          name: element.name, id: element.number, champion: champion.id));
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: [...skins],
          ),
        ],
      ),
    );
  }
}
