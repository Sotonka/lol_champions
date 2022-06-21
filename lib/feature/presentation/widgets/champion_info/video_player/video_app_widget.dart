import 'package:lol_champions/feature/presentation/widgets/champion_info/video_player/video_player_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  final String url;

  VideoApp({super.key, required this.url});

  @override
  _VideoAppState createState() => _VideoAppState(url);
}

class _VideoAppState extends State<VideoApp> {
  final String url;
  late VideoPlayerController _controller;

  _VideoAppState(this.url);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          VideoPlayerWidget(controller: _controller),
        ],
      ),
    );
  }
}
