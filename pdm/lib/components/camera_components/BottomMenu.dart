import 'package:flutter/material.dart';
import 'package:pdm/components/camera_components/AnimationButton.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
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
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(5)),
                ),

                //Botão
                AnimationButton(),

                //Mudar câmera
                Container(
                  child: Icon(
                    Icons.flip_camera_ios,
                    size: 40,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
