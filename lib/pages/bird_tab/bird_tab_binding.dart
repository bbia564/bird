import 'package:get/get.dart';

import '../bird_first/bird_first_logic.dart';
import '../bird_second/bird_second_logic.dart';
import 'bird_tab_logic.dart';

class BirdTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BirdTabLogic());
    Get.lazyPut(() => BirdFirstLogic());
    Get.lazyPut(() => BirdSecondLogic());
  }
}
