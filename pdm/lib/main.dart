import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pdm/controllers/CameraAppController.dart';

import 'package:pdm/views/Home.dart';

CameraAppController cameraAppController = new CameraAppController();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameraAppController.cameras = await availableCameras();
  cameraAppController.initController();

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
