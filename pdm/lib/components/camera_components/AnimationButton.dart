import 'package:flutter/material.dart';

class AnimationButton extends StatefulWidget {
  const AnimationButton({Key? key}) : super(key: key);

  @override
  _AnimationButtonState createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  double animationHeight = 0;
  double animationWidth = 0;
  Color animationColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 1),
          height: 94,
          width: 94,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              //color: Colors.white,
              border: Border.all(color: animationColor)),
          child: CircularProgressIndicator(
            value: controller.value,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
        /*
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
        ),
        */
        GestureDetector(
          onTapDown: (_) {
            controller.forward();
            setState(() {
              animationColor = Colors.white;
            });
          },
          onTapUp: (_) {
            if (controller.status == AnimationStatus.forward) {
              setState(() {
                animationColor = Colors.transparent;
                controller.value = 0;
              });
              //controller.reverse();
            }
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
