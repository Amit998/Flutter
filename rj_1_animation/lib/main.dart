import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget with SingleTickerProviderStateMixin{
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
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: 10.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));

    tranformationAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(125.0),
            end: BorderRadius.circular(0.0))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              alignment: Alignment.topLeft,
              child: Text(
                "Hello \nThere",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: TextField(
                decoration:
                    InputDecoration(hintText: "Email", labelText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Password", labelText: "Password"),
              ),
            ),
            Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.75,
                alignment: Alignment.topRight,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.green),
                )),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: FlatButton(
                color: Colors.green,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  Text(
                    "Login In With Facebook",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New to spotify,?"),
                  Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
