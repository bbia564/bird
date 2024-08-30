import 'package:bird_project/db_bird/db_bird.dart';
import 'package:bird_project/pages/bird_first/bird_first_binding.dart';
import 'package:bird_project/pages/bird_first/bird_first_view.dart';
import 'package:bird_project/pages/bird_first/game/game_binding.dart';
import 'package:bird_project/pages/bird_first/game/game_view.dart';
import 'package:bird_project/pages/bird_first/game/tool.dart';
import 'package:bird_project/pages/bird_first/game_records/game_records_binding.dart';
import 'package:bird_project/pages/bird_first/game_records/game_records_view.dart';
import 'package:bird_project/pages/bird_first/game_set/game_set_binding.dart';
import 'package:bird_project/pages/bird_first/game_set/game_set_view.dart';
import 'package:bird_project/pages/bird_second/bird_second_binding.dart';
import 'package:bird_project/pages/bird_second/bird_second_view.dart';
import 'package:bird_project/pages/bird_set/bird_set_binding.dart';
import 'package:bird_project/pages/bird_set/bird_set_view.dart';
import 'package:bird_project/pages/bird_tab/bird_tab_binding.dart';
import 'package:bird_project/pages/bird_tab/bird_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.black;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBBird().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageLists,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> PageLists = [
  GetPage(name: '/', page: () => const BirdSetView(), binding: BirdSetBinding()),
  GetPage(name: '/bird_tab', page: () => BirdTabPage(), binding: BirdTabBinding()),
  GetPage(name: '/bird_first', page: () => BirdFirstPage(), binding: BirdFirstBinding()),
  GetPage(name: '/bird_second', page: () => BirdSecondPage(), binding: BirdSecondBinding()),
  GetPage(name: '/bird_tool', page: () => const BirdTool()),
  GetPage(name: '/bird_game', page: () => GamePage(),binding: GameBinding()),
  GetPage(name:'/bird_game_set', page: () => GameSetPage(),binding: GameSetBinding()),
  GetPage(name: '/bird_game_records', page: () => GameRecordsPage(),binding: GameRecordsBinding()),
];
