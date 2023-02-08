import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: myApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

PermissionStatus? camera;
PermissionStatus? calender;
PermissionStatus? location;
PermissionStatus? microphone;
PermissionStatus? photos;
PermissionStatus? sms;
PermissionStatus? phones;
PermissionStatus? contacts;

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Permissions ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Transform.scale(
          scale: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        PermissionStatus status =
                            await Permission.camera.request();
                        setState(() {
                          camera = status;
                        });
                        print(camera);
                      },
                      child: Text('Camera'),
                    ),
                    Spacer(),
                    Text(
                      '${camera}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        PermissionStatus status =
                            await Permission.calendar.request();
                        print(status);
                        setState(() {
                          calender = status;
                        });
                      },
                      child: Text('Calender'),
                    ),
                    Spacer(),
                    Text(
                      '${calender}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        PermissionStatus status =
                            await Permission.location.request();
                        setState(() {
                          location = status;
                        });
                        print(status);
                      },
                      child: Text('Location'),
                    ),
                    Spacer(),
                    Text(
                      '${location}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        PermissionStatus status =
                            await Permission.microphone.request();
                        print(status);
                        setState(() {
                          microphone = status;
                        });
                      },
                      child: Text('Microphone'),
                    ),
                    Spacer(),
                    Text(
                      '${microphone}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        PermissionStatus status =
                            await Permission.photos.request();
                        print(status);
                        setState(() {
                          photos = status;
                        });
                      },
                      child: Text('Photos'),
                    ),
                    Spacer(),
                    Text(
                      '${photos}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        PermissionStatus status = await Permission.sms.request();
                        setState(() {
                          sms = status;
                        });
                      },

                      child: Text('SMS'),
                    ),
                    Spacer(),
                    Text(
                      '${sms}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        PermissionStatus status =
                            await Permission.phone.request();
                        setState(() {
                          phones = status;
                        });
                      },
                      child: Text('Phone'),
                    ),
                    Spacer(),
                    Text(
                      '${phones}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        PermissionStatus status =
                            await Permission.contacts.request();
                        print(status);
                        setState(() {
                          contacts = status;
                        });
                      },
                      child: Text('contacts'),
                    ),
                    Spacer(),
                    Text(
                      '${contacts}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                          ,
                          color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
