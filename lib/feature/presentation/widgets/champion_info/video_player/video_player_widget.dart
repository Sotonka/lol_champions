import 'package:flutter/material.dart';
import 'package:lol_champions/common/app_colors.dart';
import 'package:lol_champions/feature/presentation/widgets/champion_info/video_player/basic_overlay_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(
              //margin: EdgeInsets.only(top: 12.0),
              //height: MediaQuery.of(context).size.height / 3.1,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter, child: buildVideo(),
            )
          : Container(
              height: MediaQuery.of(context).size.height / 3.1,
              child: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.mainAccent,
              )),
            );

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(child: BasicOverlayWidget(controller: controller)),
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
