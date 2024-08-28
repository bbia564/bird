
import 'package:bird_project/pages/bird_first/bird_first_binding.dart';
import 'package:bird_project/pages/bird_first/game/game_binding.dart';
import 'package:bird_project/pages/bird_first/game/game_view.dart';
import 'package:bird_project/pages/bird_first/game_set/game_set_view.dart';
import 'package:bird_project/pages/bird_tab/bird_tab_binding.dart';
import 'package:bird_project/pages/bird_tab/bird_tab_view.dart';
import 'package:bird_project/router/bird_names.dart';
import 'package:get/get.dart';

import '../pages/bird_first/bird_first_view.dart';
import '../pages/bird_first/game_records/game_records_binding.dart';
import '../pages/bird_first/game_records/game_records_view.dart';
import '../pages/bird_first/game_set/game_set_binding.dart';
import '../pages/bird_second/bird_second_binding.dart';
import '../pages/bird_second/bird_second_view.dart';

class BirdPages {

  static pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
  }) {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      preventDuplicates: true,
      transition: Transition.cupertino,
      popGesture: true,
    );
  }

  static List<GetPage> list = [
    pageBuilder(name: BirdNames.birdTab, page: () => BirdTabPage(), binding: BirdTabBinding()),
    pageBuilder(name: BirdNames.birdFirst, page: () => BirdFirstPage(), binding: BirdFirstBinding()),
    pageBuilder(name: BirdNames.birdSecond, page: () => BirdSecondPage(), binding: BirdSecondBinding()),
    pageBuilder(name: BirdNames.birdGame, page: () => GamePage(),binding: GameBinding()),
    pageBuilder(name: BirdNames.birdGameSet, page: () => GameSetPage(),binding: GameSetBinding()),
    pageBuilder(name: BirdNames.birdGameRecords, page: () => GameRecordsPage(),binding: GameRecordsBinding()),
  ];
}