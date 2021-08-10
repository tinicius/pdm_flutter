import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  const Imc({Key? key}) : super(key: key);

  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  bool masCheck = false;
  TextEditingController massaController = new TextEditingController();
  bool femCheck = false;
  TextEditingController alturaController = new TextEditingController();

  GlobalKey<FormState> key = new GlobalKey<FormState>();

  Map<String, dynamic> resultado = {
    "altura": 0.0,
    "massa": 0.0,
    "sexo": "",
    "imc": 0.0
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imc"),
      ),
      body: Form(
        key: key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Altura: ${resultado["altura"]}"),
                      Text("Massa: ${resultado["massa"]}"),
                      Text("Sexo: ${resultado["sexo"]}"),
                      Text("IMC: ${resultado["imc"]}")
                    ],
                  )),
                  height: 200,
                  width: 500,
                  decoration:
                      BoxDecoration(color: Colors.blue, border: Border.all())),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: alturaController,
                decoration: InputDecoration(
                    labelText: "Altura:", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: massaController,
                decoration: InputDecoration(
                    labelText: "Massa:", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text("Masculino"),
                      Checkbox(
                          value: masCheck,
                          onChanged: (value) {
                            setState(() {
                              masCheck = value!;
                              femCheck = !value;
                            });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Feminino"),
                      Checkbox(
                          value: femCheck,
                          onChanged: (value) {
                            setState(() {
                              masCheck = !value!;
                              femCheck = value;
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var massa = double.parse(massaController.text);
                  var altura = double.parse(alturaController.text);
                  var sexo = " ";

                  if (masCheck) {
                    sexo = "Masculino";
                  } else {
                    sexo = "Feminino";
                  }

                  var res = massa / (altura * altura);

                  setState(() {
                    resultado["altura"] = altura;
                    resultado["massa"] = massa;
                    resultado["sexo"] = sexo;
                    resultado["imc"] = res;
                  });
                },
                child: Text("Confirmar"))
          ],
        ),
      ),
    );
  }
}
