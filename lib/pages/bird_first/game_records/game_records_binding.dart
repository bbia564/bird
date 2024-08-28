import 'package:get/get.dart';

import 'game_records_logic.dart';

class GameRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameRecordsLogic());
  }
}
