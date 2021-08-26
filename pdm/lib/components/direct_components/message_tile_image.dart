import 'package:flutter/material.dart';
import 'package:pdm/data/models/message.dart';

class MessageTileImage extends StatelessWidget {
  final Message? message;
  final String? image;

  MessageTileImage({Key? key, this.image, this.message, this.size1 = 50})
      : super(key: key);

  final double size1;

  @override
  Widget build(BuildContext context) {
    if (message!.online!) {
      if (message!.status!) {
        //on + status
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size1,
              width: size1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.purple, Colors.pink, Colors.yellow],
                ),
              ),
            ),
            Container(
              height: size1 - 4,
              width: size1 - 4,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            ClipOval(
              child: Image.asset(
                image!,
                width: size1 - 8,
                height: size1 - 8,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: size1,
              height: size1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.green.shade300,
                              shape: BoxShape.circle))
                    ],
                  ),
                ),
              ),
              //color: Colors.black,
            ),
          ],
        );
      }

      // online
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size1,
            width: size1,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
          ClipOval(
            child: Image.asset(
              image!,
              width: size1 - 4,
              height: size1 - 4,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: size1,
            height: size1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle))
                  ],
                ),
              ),
            ),
            //color: Colors.black,
          ),
        ],
      );
    } else {
      if (message!.status!) {
        //off + status
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size1,
              width: size1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.purple, Colors.pink, Colors.yellow],
                ),
              ),
            ),
            Container(
              height: size1 - 4,
              width: size1 - 4,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            ClipOval(
              child: Image.asset(
                image!,
                width: size1 - 8,
                height: size1 - 8,
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      }

      // offline
      return ClipOval(
        child: Image.asset(
          image!,
          width: size1,
          height: size1,
          fit: BoxFit.fill,
        ),
      );
    }
  }
}
