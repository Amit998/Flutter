import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SDBSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 300,
              child: RaisedButton(
                color: Colors.green,
                child: Text(
                  "Show SnackBar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Get.snackbar("Great SnackBar", "Snackbar done in one line",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.grey);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 300,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Show SnackBar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Get.defaultDialog(
                      title: "GetX Dialog",
                      content: Column(
                        children: [
                          Text("This is Awsome"),
                          Text("This is Awsome"),
                        ],
                      ));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 300,
              child: RaisedButton(
                color: Colors.deepPurple,
                child: Text(
                  "Show SnackBar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                    height: 100,
                    color: Colors.white,
                    child: ListTile(title: Text("AMIT")),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
