import 'package:flutter/material.dart';
import 'package:pdm/components/Calc_components/operacoes.dart';

class Tecla extends StatelessWidget {
  final Function? updateState;
  final double? height;
  final double? width;
  final String? text;
  final Operacoes? operacoes;

  final bool? isBigger;

  Tecla(
      {this.text = "",
      this.height,
      this.width,
      this.isBigger,
      @required this.updateState,
      @required this.operacoes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            operacoes!.comando(text!);
            updateState!();
          },
          child: Container(
            //color: Colors.blue,
            height: height,
            width: width,
            child: Center(
              child: Text(
                text!,
                style: TextStyle(fontSize: 21),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
