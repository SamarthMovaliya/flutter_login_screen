import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        backgroundColor: Colors.amber,
        title: const Text(
          'HomePage',
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 25, color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome',
          style: GoogleFonts.aladin(
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
            fontSize: 120,
            color: Colors.white24,
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey.shade900,
    );
  }
}
