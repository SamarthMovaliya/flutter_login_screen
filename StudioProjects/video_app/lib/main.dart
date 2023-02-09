import 'package:flutter/material.dart';
import 'package:video_app/globals.dart';
import 'package:video_app/screens/VideoApp.dart';

void main() {
  runApp(videoApp());
}

class videoApp extends StatefulWidget {
  const videoApp({Key? key}) : super(key: key);

  @override
  State<videoApp> createState() => _videoAppState();
}

class _videoAppState extends State<videoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'video': (context) =>  VideoApp(),
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List videos = [
    {
      'image':
          'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg?w=2000',
      'name': 'Green World',
      'vd':
          'https://vod-progressive.akamaized.net/exp=1675978979~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F3133%2F31%2F790665520%2F3538556238.mp4~hmac=8dbf2b1c3f6132709b61b650793b6ed253885ce134aae01daf7d11f142d29165/vimeo-prod-skyfire-std-us/01/3133/31/790665520/3538556238.mp4?filename=file.mp4'
    },
    {
      'image':
          'https://w0.peakpx.com/wallpaper/350/318/HD-wallpaper-ice-mountain-nature.jpg',
      'name': 'Ice Spikes',
      'vd':
          'https://vod-progressive.akamaized.net/exp=1674733523~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1111%2F20%2F505557796%2F2316540706.mp4~hmac=3bbb5e5a3e74a54c20964ca3121231017f89e10466e0f2e031871355ab0355ba/vimeo-prod-skyfire-std-us/01/1111/20/505557796/2316540706.mp4'
    },
    {
      'image':
          'https://s1.1zoom.me/b6646/948/Egypt_Desert_Cairo_Pyramid_Sand_515482_3840x2400.jpg',
      'name': 'Red Sand',
      'vd':
          'https://vod-progressive.akamaized.net/exp=1674733675~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2350%2F22%2F561753898%2F2656506018.mp4~hmac=0d35076a415900f4901ab7f686ee274c618b48f340a4bafa25f185bbca31d83a/vimeo-prod-skyfire-std-us/01/2350/22/561753898/2656506018.mp4'
    },
    {
      'image': 'https://wallpapercave.com/wp/wp3294894.jpg',
      'name': 'Drop World',
      'vd':
          'https://vod-progressive.akamaized.net/exp=1674733852~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=253e4209d11823247d7858589875700104f216abc9fdef89204fed11020c92db/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Video Player',
          style: TextStyle(
            letterSpacing: 10,
            fontWeight: FontWeight.w900,
            fontSize: 40,
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey.shade800,
                Colors.blueGrey,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: videos
              .map(
                (e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                     setState(() {
                       CurrentVal = e;
                     });
                      Navigator.pushNamed(
                        context,
                        'video',
                        arguments: e,
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(e['image']),
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.shade800,
                            blurRadius: 10,
                            offset: Offset(7, 10),
                          ),
                        ],
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        height: 130,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Row(
                            children: [
                              Text(
                                e['name'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 10,
                                    fontSize: 24,
                                    color: Colors.white70),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white70,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
