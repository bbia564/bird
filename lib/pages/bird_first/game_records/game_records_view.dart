import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'game_records_logic.dart';

class GameRecordsPage extends GetView<GameRecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Game records',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Obx(() {
          return controller.list.value.isEmpty
              ? <Widget>[
                  Image.asset(
                    'assets/noData.webp',
                    width: 39,
                    height: 39,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'No data',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ].toColumn(mainAxisAlignment: MainAxisAlignment.center)
              : ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    return <Widget>[
                      <Widget>[
                        Text(
                          '${entity.count} decimal places',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Text(
                          entity.createTimeStr,
                          style: const TextStyle(
                              color: Color(0xffa5a5a5), fontSize: 13),
                        )
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      Divider(
                        height: 25,
                        color: Colors.white.withOpacity(0.13),
                      )
                    ].toColumn();
                  });
        }),
      )
              .decorated(
                  color: const Color(0xff434343),
                  borderRadius: BorderRadius.circular(10))
              .marginAll(15)),
    );
  }
}
