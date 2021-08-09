import 'package:flutter/material.dart';
import 'package:pdm/components/Calc_components/teclado.dart';
import 'package:pdm/controllers/CalculadoraController.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  _updateState() {
    setState(() {});
  }

  CalculadoraController _controller =
      new CalculadoraController(updateState: null);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    child: Text(
                      _controller.operacoes.textoTela,
                      style: TextStyle(fontSize: 21),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  Align(
                    child: Text(
                      _controller.operacoes.textoResultado,
                      style: TextStyle(fontSize: 21),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.black12,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Teclado(
                    constraints: constraints,
                    operacoes: _controller.operacoes,
                    updateState: _updateState,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
