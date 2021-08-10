import 'package:flutter/material.dart';
import 'package:pdm/views/Calculadora.dart';
import 'package:pdm/views/Imc.dart';
import 'package:pdm/views/PerfilPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calculadora()));
                },
                child: Text('Calculadora')),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PerfilPage()));
                },
                child: Text('PerfilPage')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Imc()));
                },
                child: Text('Imc'))
          ],
        ),
      ),
    );
  }
}
