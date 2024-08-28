import 'package:get/get.dart';

class GameSetLogic extends GetxController {

  var duration = 30.obs;
  var count = 3.obs;

  void durationChange({bool isAdd = true}) {
    if (isAdd) {
      if (duration.value < 60) {
        duration.value++;
      }
    } else {
      if (duration.value > 1) {
        duration.value--;
      }
    }
  }

  void countChange({bool isAdd = true}) {
    if (isAdd) {
      if (count.value < 5) {
        count.value++;
      }
    } else {
      if (count.value > 1) {
        count.value--;
      }
    }
  }

}
