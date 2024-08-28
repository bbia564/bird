import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:super_rich_text/super_rich_text.dart';

import 'game_logic.dart';

class GamePage extends GetView<GameLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameLogic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            controller.type == 0 ? 'Game Mode' : 'Practice Mode',
            style: const TextStyle(color: Colors.white),
          ),
          leading: Image.asset(
            'assets/close.webp',
            width: 23,
            height: 23,
          ).gestures(onTap: () {
            controller.stop();
            controller.saveData();
            Get.back();
          }),
          actions: [
            Obx(() {
              return Text(
                controller.downtimeStr.value,
                style: const TextStyle(color: Colors.white),
              );
            })
          ],
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
                      alignment: Alignment.center,
                      child: Obx(() {
                        return Text(
                          controller.result.value,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 56),
                        );
                      }))
                      .decorated(
                      color: const Color(0xff24201d),
                      borderRadius: BorderRadius.circular(10))
                      .constrained(minHeight: 126),
                  Visibility(
                    visible: controller.type == 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      height: 44,
                      child: GridView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 5,
                              childAspectRatio: 20 / 24),
                          itemCount: controller.totalHeart,
                          itemBuilder: (_, index) {
                            return Container(
                              child: Image.asset(
                                'assets/${index < controller.currentHeart
                                    ? 'redHeart'
                                    : 'greyHeart'}.webp',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
                  ),
                  Obx(() {
                    return Text(
                      'The ${controller.myCount.value} decimal place',
                      style: const TextStyle(
                          color: Color(0xff8e8e8e), fontSize: 20),
                    );
                  }).marginOnly(top: 10),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 96 / 70),
                          itemCount: 11,
                          itemBuilder: (_, index) {
                            return Visibility(
                              visible: index != 9,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  (index == 10 ? 0 : (9 - index)).toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              )
                                  .decorated(
                                  color: const Color(0xfff2e5cb),
                                  borderRadius: BorderRadius.circular(10))
                                  .gestures(onTap: () {
                                if (index == 10) {
                                  const num = 0;
                                  if (controller.piStr.substring(
                                      controller.myCount.value + 1,
                                      controller.myCount.value + 2) ==
                                      num.toString()) {
                                    controller.myCount.value += 1;
                                    controller.result.value += num.toString();
                                  } else {
                                    Fluttertoast.showToast(msg: 'Input error');
                                    if (controller.type == 0) {
                                      controller.currentHeart -= 1;
                                      controller.update();
                                      if (controller.currentHeart <= 0) {
                                        controller.stop();
                                        controller.update();
                                        Fluttertoast.showToast(msg: 'Game over');
                                        controller.saveData();
                                        Get.back();
                                      }
                                    }
                                    return;
                                  }
                                } else {
                                  final num = 9 - index;
                                  if (controller.piStr.substring(
                                      controller.myCount.value + 1,
                                      controller.myCount.value + 2) ==
                                      num.toString()) {
                                    controller.myCount.value += 1;
                                    controller.result.value += num.toString();
                                  } else {
                                    Fluttertoast.showToast(msg: 'Input error');
                                    if (controller.type == 0) {
                                      controller.currentHeart -= 1;
                                      controller.update();
                                      if (controller.currentHeart <= 0) {
                                        controller.stop();
                                        controller.update();
                                        Fluttertoast.showToast(msg: 'Game over');
                                        controller.saveData();
                                        Get.back();
                                      }
                                    }
                                    return;
                                  }
                                }
                                if (controller.result.value ==
                                    controller.piStr) {
                                  Fluttertoast.showToast(msg: '''Congratulations, you've got them all right''');
                                  controller.saveData();
                                  Get.back();
                                }
                              }),
                            );
                          }),
                    ),
                  ).decorated(
                      color: const Color(0xff434343),
                      borderRadius: BorderRadius.circular(10))
                ].toColumn(),
              ).marginAll(15)),
        ),
      );
    });
  }
}
