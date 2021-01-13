import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  @override
  _SandboxState createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _margrin = 20;
  bool _opacity = true;
  double _width = 200;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        margin: EdgeInsets.all(_margrin),
        width: _width,
        duration: Duration(milliseconds: 900),
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Animate Margin"),
              onPressed: () {
                setState(() {
                  _margrin += 50;
                });
              },
            ),
            RaisedButton(
              child: Text("Animate color"),
              onPressed: () {
                setState(() {
                  _color = Colors.purple;
                });
              },
            ),
            RaisedButton(
              child: Text("Animate Width"),
              onPressed: () {
                setState(() {
                  _width += 50;
                });
              },
            ),
            RaisedButton(
              child: Text("Animate Opactity"),
              onPressed: () {
                setState(() {
                  _opacity = !_opacity;
                  print('object');
                });
              },
            ),
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _opacity ? 1 : 0, 
              child: Text(
                "Hide Me",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
