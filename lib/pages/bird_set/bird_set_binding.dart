import 'package:get/get.dart';

import 'bird_set_logic.dart';

class BirdSetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
