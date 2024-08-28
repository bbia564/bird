import 'package:get/get.dart';

import 'bird_first_logic.dart';

class BirdFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BirdFirstLogic());
  }
}
