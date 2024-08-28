import 'package:bird_project/db_bird/bird_entity.dart';
import 'package:bird_project/db_bird/db_bird.dart';
import 'package:get/get.dart';

class GameRecordsLogic extends GetxController {

  DBBird dbBird = Get.find<DBBird>();

  var list = <BirdEntity>[].obs;

  void getData() async {
    list.value = await dbBird.getBirdAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
