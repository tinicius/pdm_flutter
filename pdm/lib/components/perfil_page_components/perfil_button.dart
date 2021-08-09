import 'package:flutter/material.dart';

class PerfilButton extends StatelessWidget {
  final onPressed;
  final String? text;
  final padding;
  final Size? size;

  PerfilButton(
      {@required this.onPressed,
      @required this.text,
      @required this.padding,
      @required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size!.width - (size!.width * 0.1),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.grey.shade300))),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Padding(
          padding: padding,
          child: Text(
            text!,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
