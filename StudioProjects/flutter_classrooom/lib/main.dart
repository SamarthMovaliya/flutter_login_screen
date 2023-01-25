import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classrooom/screens/webview.dart';

void main() {
  runApp(const myApp());
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
        'webView': (context) => webViewAll(),
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
  int currentpg = 0;
  CarouselController carouselController = CarouselController();
  List platforms = [
    {
      'name': 'Google',
      'url': 'http://www.google.com',
      'photo':
          'https://media.wired.co.uk/photos/606d9a3ba876dd2203a639aa/1:1/w_2000,h_2000,c_limit/wired-uk-google-watching.jpg',
    },
    {
      'name': 'Byjus',
      'url': 'https://byjus.com/',
      'photo': 'https://static.toiimg.com/photo/msid-86786831/86786831.jpg',
    },
    {
      'name': 'JavaTPoint',
      'url': 'https://www.javatpoint.com/',
      'photo': 'https://wallpapercave.com/wp/wp7250052.jpg',
    },
    {
      'name': 'Wikipedia',
      'url': 'https://www.wikipedia.org/',
      'photo':
          'https://www.muycomputer.com/wp-content/uploads/2021/03/Wikipedia-1000x600.jpg',
    },
    {
      'name': 'W3 School',
      'url': 'https://www.w3schools.com/',
      'photo':
          'https://www.dreamstojourneys.com/wp-content/uploads/2022/03/W3SCHOOLS.png',
    },
  ];
  String name = 'Google';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu_rounded,
          size: 27,
        ),
        centerTitle: false,
        title: GestureDetector(
          child: const Text(
            'Educational Sites',
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
                Colors.blueGrey.shade900,
                Colors.indigo.shade400,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        color: Colors.indigo.shade400,
        child: Container(
          height: 700,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.indigo.shade900,
                  blurRadius: 14,
                  spreadRadius: 3,
                  offset: const Offset(-2, -3))
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900),
              ),
              CarouselSlider(
                carouselController: carouselController,
                items: platforms
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'webView',
                                arguments: e);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(e['photo']),
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(7, 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  initialPage: currentpg,
                  onPageChanged: (val, _) {
                    setState(() {
                      currentpg = val;
                      name = platforms[val]['name'];
                    });
                  },
                  height: 400,
                  viewportFraction: 0.75,
                  enlargeCenterPage: true,
                ),
              ),
              Align(
                child: Container(
                  height: 100,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: platforms
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                carouselController.animateToPage(
                                    platforms.indexOf(e),
                                    curve: Curves.easeInOut);
                                name = e['name'];
                              });
                            },
                            child: CircleAvatar(
                              radius:
                                  (currentpg == platforms.indexOf(e)) ? 10 : 8,
                              backgroundColor:
                                  (currentpg == platforms.indexOf(e))
                                      ? Colors.grey
                                      : Colors.grey.shade300,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
