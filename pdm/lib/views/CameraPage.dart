import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pdm/components/camera_components/BottomMenu.dart';
import 'package:pdm/components/camera_components/cameraApp.dart';
import 'package:pdm/main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  void updateState() {
    setState(() {});
  }

  IconData getFlashIcon(FlashMode mode) {
    if (mode == FlashMode.off) {
      return Icons.flash_off;
    } else if (mode == FlashMode.always) {
      return Icons.flash_on;
    } else {
      return Icons.flash_auto;
    }
  }

  void onSetFlashMode(FlashMode mode) {
    setState(() {
      cameraAppController.controller.setFlashMode(mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.transparent),
        elevation: 0.0,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                    onPressed: () {
                      if (cameraAppController.controller.value.flashMode ==
                          FlashMode.off) {
                        return onSetFlashMode(FlashMode.always);
                      } else if (cameraAppController
                              .controller.value.flashMode ==
                          FlashMode.always) {
                        return onSetFlashMode(FlashMode.auto);
                      }
                      if (cameraAppController.controller.value.flashMode ==
                          FlashMode.auto) {
                        return onSetFlashMode(FlashMode.off);
                      }
                    },
                    icon: Icon(
                      getFlashIcon(
                          cameraAppController.controller.value.flashMode),
                      color: Colors.white,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close, color: Colors.white, size: 40))
              ],
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            CameraApp(cameras: cameraAppController.cameras),
            //Container(
            //color: Colors.blue,
            //),
            BottomMenu(
              updateState: updateState,
            )
          ],
        ),
      ),
    );
  }
}
