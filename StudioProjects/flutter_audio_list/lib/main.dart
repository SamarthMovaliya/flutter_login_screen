import 'package:flutter/material.dart';
import 'package:flutter_audio_list/globals/modals.dart';
import 'package:flutter_audio_list/screens/audio.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'audio': (context) => AudioView(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.more_vert,
          size: 27,
        ),
        centerTitle: false,
        title: GestureDetector(
          child: const Text(
            'My PlayList',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.brown.shade900,
                Colors.red.shade400,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: myMusic
              .map(
                (e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSong = e;
                      });
                      Navigator.pushNamed(
                        context,
                        'audio',
                        arguments: e,
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: e['color'],
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
                        alignment: Alignment.center,
                        height: 150,
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
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(e['image']),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                e['name'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 5,
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
