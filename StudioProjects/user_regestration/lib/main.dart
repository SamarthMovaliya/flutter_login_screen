import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_regestration/global/globals.dart';
import 'package:user_regestration/screens/homepage.dart';
import 'package:user_regestration/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isRegister = prefs.getBool('register') ?? false;
  if (prefs == null) {
  } else {
    List? data = prefs.getStringList('LoginData');
    allDatas.add(data?[0]);
    allDatas.add(data?[1]);
  }
  print(isRegister);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: (isRegister == true) ? 'login' : 'register',
    routes: {
      'register': (context) => Register(),
      'login': (context) => Login(),
      'homepage': (context) => HomePage(),
    },
  ));
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  navigate() {
    Navigator.pushReplacementNamed(context, 'homepage');
  }

  var emailSaved;
  var passwordSaved;
  bool b1 = true;
  bool b2 = false;
  final myKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                      'Register',
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
                          return 'Enter your Email';
                        }
                        return null;
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
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please enter password';
                        }
                        return null;
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
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        onPressed: () async {
                          if (myKey.currentState!.validate()) {
                            myKey.currentState!.save();
                            print(emailSaved);
                            print(passwordSaved);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setStringList(
                                'LoginData', [emailSaved, passwordSaved]);
                            prefs.setBool('done', true);
                            print(prefs.getBool('done'));
                            print(prefs.getStringList('LoginData')![0]);
                            prefs.setBool('register', true);
                            navigate();
                          }
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Already Have an account ?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            'Log in',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.yellow),
                          ),
                        ),
                      ),
                    ],
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
