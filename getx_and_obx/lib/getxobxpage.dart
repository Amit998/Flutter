import 'package:flutter/material.dart';


class GetxObx extends StatefulWidget {
  @override
  _GetxObxState createState() => _GetxObxState();
}

class _GetxObxState extends State<GetxObx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Send Data"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Thsi is value 1: ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Thsi is value 2: ",
              style: TextStyle(fontSize: 20),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("Change The Value",
                  style: TextStyle(
                    color: Colors.black,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
