

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestures"),
        centerTitle: true,
      ),
      body: new Center(
        child: InkWell(
          splashColor: Colors.yellowAccent,
          onDoubleTap: () {
            print("object");
          },
          child: Container(
            alignment: Alignment.center,
            height: 70,
            width: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text("Click Me"),
          ),
        ),
      ),
    );
  }
}
