import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_list/globals/modals.dart';

class AudioView extends StatefulWidget {
  const AudioView({Key? key}) : super(key: key);

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  double myVal = 0.0;
  bool isPlaying = false;
  bool mute = true;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration timeOfSong = const Duration(seconds: 0);

  playAudio() async {
    await assetsAudioPlayer.open(
      Audio(
        selectedSong['music'],
      ),
      autoStart: false,
    );
    setState(() {
      timeOfSong = assetsAudioPlayer.current.value!.audio.duration;
    });
  }

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  @override
  void dispose() {
    super.dispose();
    playAudio();
  }

  @override
  Widget build(BuildContext context) {
    Map e = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            invertColors: true,
            image: NetworkImage(
              e['image'],
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Text(
                e['name'],
                style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.8), BlendMode.colorDodge),
                      image: NetworkImage(
                        '${e['image']}',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade800,
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: Offset(4, 5),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade600,
                        Colors.grey.shade50,
                      ],
                      begin: Alignment.topLeft,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black12,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e['name'],
                              style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Colors.blueGrey,
                      Colors.white,
                      Colors.blueGrey,
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade900,
                          offset: Offset(2, 3),
                          blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(100)),
                child: StreamBuilder(
                  stream: assetsAudioPlayer.currentPosition,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    Duration? totalDuration = snapshot.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Slider(
                          max: (assetsAudioPlayer
                                      .current.value?.audio.duration ==
                                  null)
                              ? 0.0
                              : assetsAudioPlayer
                                  .current.value!.audio.duration.inSeconds
                                  .toDouble(),
                          min: 0,
                          onChanged: (val) {
                            setState(() {
                              Duration time = Duration(seconds: val.toInt());
                              assetsAudioPlayer.seek(time);
                            });
                          },
                          value: totalDuration!.inSeconds.toDouble(),
                        ),
                        Row(
                          children: [
                            Text(
                              '${totalDuration.toString().split(".")[0]}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              ' / ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              '${assetsAudioPlayer.current.valueOrNull!.audio.duration.toString().split(".")[0]}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        )
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () async {
                        await assetsAudioPlayer.stop();
                      },
                      child: const Icon(Icons.stop),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: (isPlaying == false)
                          ? FloatingActionButton(
                              onPressed: () async {
                                setState(() {
                                  isPlaying = true;
                                });
                                await assetsAudioPlayer.play();
                              },
                              child: const Icon(
                                Icons.play_arrow,
                                size: 80,
                              ),
                            )
                          : FloatingActionButton(
                              onPressed: () async {
                                setState(() {
                                  isPlaying = false;
                                });
                                await assetsAudioPlayer.pause();
                              },
                              child: const Icon(
                                Icons.pause,
                                size: 80,
                              ),
                            ),
                    ),
                    (mute)
                        ? FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                mute = false;
                              });
                            },
                            child: const Icon(
                              Icons.volume_up,
                            ),
                          )
                        : FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                mute = true;
                              });
                            },
                            child: const Icon(
                              Icons.volume_off,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
