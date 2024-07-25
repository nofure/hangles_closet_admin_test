import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hangles_closet_admin/index/index_controller.dart';

class IndexView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BuildContext context = Get.context!;
    return GetBuilder<IndexController>(
        init: IndexController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text(controller.datas.toString()),
                ],
              ),
            ),
          );
        });
  }
}
