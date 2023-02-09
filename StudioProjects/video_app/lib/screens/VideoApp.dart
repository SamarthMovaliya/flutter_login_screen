import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_app/globals.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late String vd;

  Future<void> VideoPlay() async {
    setState(() {});
    videoPlayerController = VideoPlayerController.network(CurrentVal!['vd']);

    await videoPlayerController.initialize();
    setState(() {});

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
    );
  }

  @override
  void initState() {
    super.initState();
    VideoPlay();
  }

  @override
  Widget build(BuildContext context) {
    Map e = ModalRoute.of(context)!.settings.arguments as Map;
    vd = e['vd'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          e['name'],
          style: const TextStyle(
            letterSpacing: 10,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        height: 900,
        color: Colors.black,
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
    );
  }
}
