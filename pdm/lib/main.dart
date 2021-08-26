import 'package:flutter/material.dart';
import 'package:pdm/views/DirectPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: DirectPage(),
      theme: ThemeData(
          //primarySwatch: Colors.white,
          primaryColor: Colors.white), // ThemeData
    ); // MaterialApp
  }
}
