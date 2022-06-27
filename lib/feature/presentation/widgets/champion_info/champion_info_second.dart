import 'package:flutter/material.dart';
import 'package:lol_champions/common/app_colors.dart';
import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';
import 'package:lol_champions/feature/presentation/widgets/champion_info/video_player/video_app_widget.dart';
import 'package:lol_champions/feature/presentation/widgets/image_widget.dart';
import 'package:lol_champions/utilities/constants.dart';

class ChampionInfoSecond extends StatelessWidget {
  final ChampionInfoEntity champion;

  const ChampionInfoSecond({Key? key, required this.champion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    String key = '0000';

    switch (champion.key.length) {
      case 1:
        key = '000${champion.key}';
        break;
      case 2:
        key = '00${champion.key}';
        break;
      case 3:
        key = '0${champion.key}';
        break;
    }
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.75,
            ),
            const Text(
              'ABILITIES',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 52,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        PageView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoApp(
                      url:
                          '${Constants.VIDEO_PATH + key}/ability_${key}_P1.webm'),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 125, left: 24, right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Image.network(Constants.IMG_PATH +
                              'passive/' +
                              champion.passive.image.full),
                        ),
                        const Text(
                          'PASSIVE',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          champion.passive.name.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          champion.passive.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoApp(
                      url:
                          '${Constants.VIDEO_PATH + key}/ability_${key}_Q1.webm'),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 125, left: 24, right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Image.network(Constants.IMG_PATH +
                              'spell/' +
                              champion.spells[0].image.full),
                        ),
                        const Text(
                          'Q',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          champion.spells[0].name.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          champion.spells[0].description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoApp(
                      url:
                          '${Constants.VIDEO_PATH + key}/ability_${key}_W1.webm'),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 125, left: 24, right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Image.network(Constants.IMG_PATH +
                              'spell/' +
                              champion.spells[1].image.full),
                        ),
                        const Text(
                          'W',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          champion.spells[1].name.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          champion.spells[1].description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoApp(
                      url:
                          '${Constants.VIDEO_PATH + key}/ability_${key}_E1.webm'),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 125, left: 24, right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Image.network(Constants.IMG_PATH +
                              'spell/' +
                              champion.spells[2].image.full),
                        ),
                        const Text(
                          'E',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          champion.spells[2].name.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          champion.spells[2].description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoApp(
                      url:
                          '${Constants.VIDEO_PATH + key}/ability_${key}_R1.webm'),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 125, left: 24, right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Image.network(Constants.IMG_PATH +
                              'spell/' +
                              champion.spells[3].image.full),
                        ),
                        const Text(
                          'R',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          champion.spells[3].name.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          champion.spells[3].description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
