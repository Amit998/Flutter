import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_and_obx/getBuilder.dart';
import 'package:getx_and_obx/homepage.dart';
import 'package:getx_and_obx/pages/RxPage.dart';
import 'package:getx_and_obx/pages/navigatePage.dart';
import 'package:getx_and_obx/pages/snackBarDialogBarBottomSheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/snackBarPage", page: () => SDBSPage()),
        GetPage(name: "/getx", page: () => RxPage()),
        GetPage(name: "/getBuilderPage", page: () => GetBuilderPage()),
        GetPage(name: "/navigatePage", page: () => NavigatePage()),
      ],
    );
  }
}
