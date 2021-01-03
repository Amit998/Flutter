import 'package:flutter/material.dart';
import 'package:flutter_animation_1/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lucky Trip",
      home: Home(),
    );
  }
}
