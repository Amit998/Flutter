import 'package:get/get.dart';

class CountController extends GetxController {
  int count = 0;

  incrementCounter() {
    count++;
    update();
  }
}
