import 'package:get/get.dart';

import 'bird_second_logic.dart';

class BirdSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BirdSecondLogic());
  }
}
