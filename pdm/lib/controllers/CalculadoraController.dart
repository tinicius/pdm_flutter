import 'package:flutter/material.dart';
import 'package:pdm/components/Calc_components/operacoes.dart';

class CalculadoraController {
  final Function? updateState;

  CalculadoraController({@required this.updateState});

  Operacoes operacoes = new Operacoes();
}
