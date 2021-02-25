import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_and_obx/controllers/valueControllers.dart';

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
            GetX<ValueController>(
              init: ValueController(),
              builder: (_) {
                return Text(
                  "Thsi is value 1: ${_.valueModel.value.value1} ",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            Obx(() => Text(
                  "Thsi is value 1: ${Get.find<ValueController>().valueModel.value.value2} ",
                  style: TextStyle(fontSize: 20),
                )),
            FlatButton(
              color: Colors.black,
              onPressed: () {
                Get.find<ValueController>().updateTheValue(
                    "The Growing Dev", "Learn and grow together");
              },
              child: Text("Change The Value",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
