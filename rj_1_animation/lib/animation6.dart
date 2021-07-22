import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, tranformationAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = Tween(begin: 0, end: -0.15).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));

    // animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: new Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            onPressed: () {},
                            child: Text("Buy"),
                            elevation: 7,
                            color: Colors.blue,
                            textColor: Colors.white,
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Text("Details"),
                            elevation: 7,
                            color: Colors.blue,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Center(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 350.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red),
                        transform: Matrix4.translationValues(
                            0.0, animation.value * width, 0.0),
                      ),
                      onTap: () {
                        animationController.forward();
                      },
                      onDoubleTap: () {
                        animationController.reverse();
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
