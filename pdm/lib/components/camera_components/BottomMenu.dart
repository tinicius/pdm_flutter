import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdm/components/camera_components/AnimationButton.dart';
import 'package:pdm/main.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key, required this.updateState}) : super(key: key);
  final Function updateState;

  @override
  _BottomMenuState createState() => _BottomMenuState(updateState: updateState);
}

class _BottomMenuState extends State<BottomMenu> {
  final Function updateState;

  _BottomMenuState({required this.updateState});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Galeria
                GestureDetector(
                  onTap: () {
                    print(cameraAppController.images.first.path);
                  },
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          //color: Colors.red,
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(5)),
                      child: (cameraAppController.images.isEmpty)
                          ? Container(
                              color: Colors.blue.shade200,
                            )
                          : Image.file(
                              File(cameraAppController.images.last.path))),
                ),

                //Botão
                AnimationButton(
                  updateState: updateState,
                ),

                //Mudar câmera
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.flip_camera_ios,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      cameraAppController.changeCamera().then((value) =>
                          cameraAppController.initialize(mounted, updateState));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
