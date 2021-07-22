

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = IntTween(begin: 0, end: 200).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: new Center(
              child: Stack(
                children: [
                  Center(
                      child: Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Loading..."),
                        Text(
                          animation.value.toString(),
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 40),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
