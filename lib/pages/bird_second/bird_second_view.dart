import 'package:bird_project/router/bird_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'bird_second_logic.dart';

class BirdSecondPage extends GetView<BirdSecondLogic> {

  Widget _item(int index, BuildContext context) {
    final titles = [
      'Game records',
      'Clean all records',
      'Privacy agreement',
      'About US'
    ];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index],style:const TextStyle(color: Colors.white),),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          Get.toNamed(BirdNames.birdGameRecords);
          break;
        case 1:
          controller.cleanAllRecords();
          break;
        case 2:
          controller.aboutPrivacy(context);
          break;
        case 3:
          controller.aboutUS(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting",style: TextStyle(color: Colors.white),),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    _item(0, context),
                    _item(1, context),
                    _item(2, context),
                    _item(3, context),
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: const Color(0xff434343),
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
