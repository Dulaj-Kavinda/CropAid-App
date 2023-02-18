import 'package:get/get.dart';

class DamageTypeController extends GetxController {
  int typeCount = 0;

  void increment() {
    typeCount++;
  }

  void updateDes(int input) {
    typeCount = input;
  }

}