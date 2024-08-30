import 'dart:async';

import 'package:bird_project/db_bird/bird_entity.dart';
import 'package:bird_project/db_bird/db_bird.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class GameLogic extends GetxController {
  DBBird dbBird = Get.find<DBBird>();

  final piStr = '3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679';

  int type = Get.arguments;
  int totalDowntime = 0;
  int currentDowntime = 0;
  int totalHeart = 0;
  int currentHeart = 0;
  var downtimeStr = ''.obs;

  var myCount = 3.obs;
  var result = '3.14'.obs;

  Timer? timer;
  bool starting = false;

  void start() {
    final minutes = currentDowntime ~/ 60;
    final minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
    final seconds = currentDowntime % 60;
    final secondsStr = seconds < 10 ? '0$seconds' : '$seconds';
    downtimeStr.value = '$minutesStr:$secondsStr';
    starting = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentDowntime--;
      final minutes = currentDowntime ~/ 60;
      final minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
      final seconds = currentDowntime % 60;
      final secondsStr = seconds < 10 ? '0$seconds' : '$seconds';
      downtimeStr.value = '$minutesStr:$secondsStr';
      if (currentDowntime <= 0) {
        saveData();
        stop();
        downTimeClock();
      }
    });
  }

  void stop() {
    timer?.cancel();
    timer = null;
    starting = false;
  }

  downTimeClock() async {
    Get.dialog(AlertDialog(
      backgroundColor: const Color(0xfff2e5cb),
      title: const Text(
        'Time out',
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 252,
        child: <Widget>[
          Image.asset(
            'assets/clack.webp',
            width: 49,
            height: 49,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              text: 'You are done',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xff8e8e8e)),
              children: <TextSpan>[
                TextSpan(
                    text: '${myCount.value-3}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black)),
                const TextSpan(
                  text: 'decimal places',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff8e8e8e)),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              'Restart',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
              .decorated(
                  color: Colors.black, borderRadius: BorderRadius.circular(15))
              .marginSymmetric(vertical: 20)
              .gestures(onTap: () {
                Get.back();
                currentDowntime = totalDowntime;
                currentHeart = totalHeart;
                myCount.value = 3;
                result.value = '3.14';
                update();
                start();
          }),
          TextButton(
            onPressed: () {
              Get.until((route) => Get.currentRoute == '/bird_game_set');
            },
            child: const Text(
              'Quit',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ].toColumn(),
      )
    ),barrierDismissible: false);
  }

  void saveData() async {
    final entity = BirdEntity(id: 0, createTime: DateTime.now(), count: myCount.value-3);
    await dbBird.insertBird(entity);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    final para = Get.parameters;
    if (para.keys.isNotEmpty) {
      totalDowntime = int.parse(para['duration']!) * 60;
      currentDowntime = totalDowntime;
      totalHeart = int.parse(para['count']!);
      currentHeart = totalHeart;
      start();
    }
    update();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    stop();
    super.onClose();
  }
}
