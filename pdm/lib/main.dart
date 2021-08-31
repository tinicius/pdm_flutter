import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:pdm/views/Home.dart';

List<CameraDescription> cameras = [];
late CameraController controller;

initController() {
  controller = CameraController(cameras[0], ResolutionPreset.max);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  initController();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
      theme: ThemeData(
          //primarySwatch: Colors.white,
          primaryColor: Colors.white), // ThemeData
    ); // MaterialApp
  }
}
