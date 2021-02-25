import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_and_obx/homepage.dart';

class NavigatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(
                "You Have Succesfully Navigated to a new Screen",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            FlatButton(
              color: Colors.black,
              child: Text(
                "Go to Home page",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.off(HomePage());
              },
            ),
            Center(
              child: Text(
                Get.arguments.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
