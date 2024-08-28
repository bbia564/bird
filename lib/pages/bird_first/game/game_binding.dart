import 'package:get/get.dart';

import 'game_logic.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameLogic());
  }
}
