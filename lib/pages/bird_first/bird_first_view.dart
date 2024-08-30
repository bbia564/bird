import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'bird_first_logic.dart';

class BirdFirstPage extends GetView<BirdFirstLogic> {
  Widget _item(int index) {
    final titles = ['Game Mode','Practice Mode'];
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      child: <Widget>[
        <Widget>[
          Image.asset(
            'assets/piIcon.webp',
            width: 29,
            height: 29,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            titles[index],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          )
        ].toRow(),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.black,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    )
        .decorated(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Color(0xfff6d56b), Color(0xffefdc9e)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter))
        .marginOnly(top: 10)
        .gestures(onTap: () {
      switch (index) {
        case 0:
          Get.toNamed('/bird_game_set');
          break;
        case 1:
          Get.toNamed('/bird_game',arguments: 1);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            const Text(
              'Remember PI',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            _item(0),
            _item(1),
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
        ).marginAll(15)),
      ),
    );
  }
}
