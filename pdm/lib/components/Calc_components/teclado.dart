import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdm/components/Calc_components/operacoes.dart';
import 'package:pdm/components/Calc_components/tecla.dart';

class Teclado extends StatelessWidget {
  final BoxConstraints? constraints;
  final Operacoes? operacoes;
  final Function? updateState;

  Teclado(
      {@required this.constraints,
      @required this.operacoes,
      @required this.updateState});

  final List matriz = [
    [1, 4, 7, 0],
    [2, 5, 8, ','],
    [3, 6, 9, ''],
    ['+', '-', 'x', '÷'],
    ['C', '=', '', '']
  ];

  ewrt(double maxH, maxW) {
    List<Widget> columns = [];

    for (var i = 0; i < matriz.length; i++) {
      List a = matriz[i];
      List<Widget> filhos = [];

      a.forEach((element) {
        filhos.add(Tecla(
          updateState: updateState,
          operacoes: operacoes,
          height: maxH / a.length,
          width: maxW / matriz.length,
          text: element.toString(),
        ));
      });

      columns.add(Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: filhos,
      ));
    }

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ewrt(constraints!.maxHeight, constraints!.maxWidth),
    );
  }
}
