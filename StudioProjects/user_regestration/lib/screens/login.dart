import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_regestration/global/globals.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailSaved;
  var passwordSaved;
  bool b1 = true;
  bool b2 = false;
  final myKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List? Data;
  SharedPreferences? prefs;

  getIt() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    getIt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Builder(builder: (context) {
              return Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(-100, -190),
                    child: Container(
                      height: 500,
                      width: 500,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.shade900,
                              offset: const Offset(2, 3),
                              blurRadius: 4,
                            )
                          ]),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(330, 180),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.shade900,
                              offset: const Offset(-2, 3),
                              blurRadius: 4,
                            )
                          ]),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(20, 350),
                    child: Text(
                      'Login',
                      style: GoogleFonts.lobster(
                          color: Colors.white, fontSize: 70, letterSpacing: 3),
                    ),
                  ),
                ],
              );
            }),
          ),
          Expanded(
            flex: 20,
            child: Form(
              key: myKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter some Data";
                        } else if (val == allDatas[0]) {
                          print(allDatas[0]);
                          return null;
                        }
                        return 'Enter your correct Email';
                      },
                      onSaved: (val) {
                        setState(() {
                          emailSaved = val;
                        });
                      },
                      controller: email,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.amber),
                        hintText: 'example@gmail.com',
                        hintStyle: const TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                              width: 2,
                              color: Colors.amber,
                              style: BorderStyle.solid),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                              width: 2,
                              color: Colors.white70,
                              style: BorderStyle.solid),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                              width: 2,
                              color: Colors.white70,
                              style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'enter Some Data';
                        } else if (val == allDatas[1]) {
                          return null;
                        }
                        return 'Enter correct password';
                      },
                      onSaved: (val) {
                        setState(() {
                          passwordSaved = val;
                        });
                      },
                      controller: password,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.password_rounded,
                          color: Colors.white,
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.amber),
                        hintText: '* * * * * * * *',
                        hintStyle: const TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                              width: 2,
                              color: Colors.amber,
                              style: BorderStyle.solid),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                              width: 2,
                              color: Colors.white70,
                              style: BorderStyle.solid),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                              width: 2,
                              color: Colors.white70,
                              style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                        ),
                        onPressed: () {
                          if (myKey.currentState!.validate()) {
                            myKey.currentState!.save();
                            Navigator.pushNamed(context,'homepage');
                          }
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Remember Me',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
