import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pdm/main.dart';

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraApp({Key? key, required this.cameras}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState(cameras);
}

class _CameraAppState extends State<CameraApp> {
  

  final List<CameraDescription> cameras;

  _CameraAppState(this.cameras);

  @override
  void initState() {
    super.initState();
    
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  
  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );
  }
}
