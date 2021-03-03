import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_and_obx/controllers/countControllers.dart';
import 'package:getx_and_obx/homepage.dart';

class GetBuilderPage extends StatelessWidget {
  CountController controller = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            GetBuilder<CountController>(
                init: CountController(),
                builder: (controller) {
                  return Text("Count Value is ${controller.count}");
                }),
            Center(
              child: Text(
                "This is the count Value",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            FlatButton(
              color: Colors.black,
              child: Text(
                "Increment The Value",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.find<CountController>().incrementCounter();
                // Get.off(HomePage());
                // controller.incrementCounter();
              },
            ),
          ],
        ),
      ),
    );
  }
}
