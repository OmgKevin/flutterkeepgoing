import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

final videoPlayerController = VideoPlayerController.network(
    'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');

final chewieController = ChewieController(
  videoPlayerController: videoPlayerController,
  aspectRatio: 1,
  autoPlay: true,
  looping: true,
);

final playerWidget = Chewie(
  controller: chewieController,
);

class VidePlayerWidget extends StatefulWidget {
  VidePlayerWidget({Key key}) : super(key: key);

  _VidePlayerWidgetState createState() => _VidePlayerWidgetState();
}

class _VidePlayerWidgetState extends State<VidePlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('VideoPalyer')),
        body: new Center(
          child: playerWidget,
        ));
  }
}
