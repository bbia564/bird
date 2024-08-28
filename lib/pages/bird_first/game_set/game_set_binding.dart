import 'package:get/get.dart';

import 'game_set_logic.dart';

class GameSetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameSetLogic());
  }
}
