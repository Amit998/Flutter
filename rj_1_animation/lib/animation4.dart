import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, childAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: 0.25, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    childAnimation = Tween(begin: 20.0, end: 180.00).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInBack));

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
            body: Align(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Transform(
                    transform: Matrix4.translationValues(animation.value, 0, 0),
                    child: Center(
                      child: AnimatedBuilder(
                          animation: childAnimation,
                          builder: (BuildContext context, Widget child) {
                            return Container(
                              height: childAnimation.value * 2,
                              width: childAnimation.value * 2,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Enter Email"),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: "Enter Password"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FlatButton(
                                      color: Colors.blue,
                                      onPressed: () {},
                                      child: Text("Login")),
                                  Text("Don't Have An coount?"),
                                  FlatButton(
                                      color: Colors.blue,
                                      onPressed: () {},
                                      child: Text("Sign Up")),
                                ],
                              ),
                            );
                          }),
                    ),
                  )),
            ),
          );
        });
  }
}
