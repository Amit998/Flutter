import 'package:get/get.dart';
import 'package:getx_and_obx/packages/valueModel.dart';

class ValueController extends GetxController {
  final valueModel = ValueModel().obs;

  updateTheValue(String newVal1, String newVal2) {
    valueModel.update((model) {
      model.value1 = newVal1;
      model.value2 = newVal2;
    });
  }
}
