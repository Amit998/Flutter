import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController(initialPage: 0);
  int pageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              pageController.animateToPage(pageChanged--,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.bounceIn);
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              pageController.animateToPage(pageChanged++,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.bounceIn);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              pageSnapping: true,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  pageChanged = index;
                });

                print(pageChanged);
              },
              children: [
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
