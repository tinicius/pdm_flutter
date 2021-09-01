import 'package:camera/camera.dart';

class CameraAppController {
  List<CameraDescription> cameras = [];
  late CameraController controller;
  //VideoPlayerController? videoController;

  List<XFile> images = [];
  List<XFile> videos = [];

  int indexCamera = 0;

  initController() {
    controller = CameraController(
        this.cameras[this.indexCamera], ResolutionPreset.medium);
  }

  initialize(mounted, updateState) {
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      updateState();
    });
  }

  Future<void> changeCamera() async {
    await this.controller.dispose();

    if (indexCamera == 0) {
      indexCamera = 1;
    } else {
      indexCamera = 0;
    }

    initController();
  }

  void onTakePicture(mounted, updateState) {
    controller.takePicture().then((XFile? file) {
      if (mounted) {
        images.add(file!);
        updateState();
      }
    });
  }

  void onStartVideoRecord(mounted, updateState) {
    print("start");
    controller.startVideoRecording().then((value) {
      if (mounted) {
        updateState();
      }
    });
  }

  Future<void> onStopVideoRecord(mounted, updateState) async {
    print("stop");
    controller.stopVideoRecording().then((file) {
      if (mounted) {
        updateState();
      }

      videos.add(file);
      print(file.path);
    });
  }
}
