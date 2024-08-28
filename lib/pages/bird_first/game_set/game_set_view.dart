import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../router/bird_names.dart';
import 'game_set_logic.dart';

class GameSetPage extends GetView<GameSetLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Game Mode',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: <Widget>[
                const Text(
                  'Game duration (minutes)',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: <Widget>[
                    Image.asset(
                      'assets/sub.webp',
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ).gestures(onTap: () {
                      controller.durationChange(isAdd: false);
                    }),
                    Obx(() {
                      return Text(
                        controller.duration.value.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      );
                    }),
                    Image.asset(
                      'assets/add.webp',
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ).gestures(onTap: () {
                      controller.durationChange(isAdd: true);
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                ).decorated(
                    color: const Color(0xff626262),
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: const Color(0xff838383), width: 1)),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'lifetimes',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: <Widget>[
                    Image.asset(
                      'assets/sub.webp',
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ).gestures(onTap: () {
                      controller.countChange(isAdd: false);
                    }),
                    Obx(() {
                      return Text(
                        controller.count.value.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      );
                    }),
                    Image.asset(
                      'assets/add.webp',
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ).gestures(onTap: () {
                      controller.countChange(isAdd: true);
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                ).decorated(
                    color: const Color(0xff626262),
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: const Color(0xff838383), width: 1)),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    'Start game',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
                    .decorated(
                        gradient: const LinearGradient(
                            colors: [Color(0xfff6d56b), Color(0xffefdc9e)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(15))
                    .gestures(onTap: () {
                  Get.toNamed(BirdNames.birdGame, arguments: 0, parameters: {
                    'duration': controller.duration.value.toString(),
                    'count': controller.count.value.toString()
                  });
                })
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ).decorated(
                color: const Color(0xff434343),
                borderRadius: BorderRadius.circular(15))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
