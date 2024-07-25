import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hangles_closet_admin/index/index_service.dart';

class IndexController extends GetxController {
  final BuildContext context = Get.context!;

  late IndexService indexService;

  ScrollController scrollontroller = ScrollController();
  // ScrollController scrollontrollerDetailsPublishedActiveView =
  //     ScrollController();
  @override
  void onInit() async {
    indexService = Get.put(IndexService());

    getDataBoxInfo();

    super.onInit();
  }

  Map<String, dynamic>? datas;
  int boxIndex = 1;
  int pageSize = 5;
  Future<void> getDataBoxInfo() async {
    try {
      boxIndex = 1;
      pageSize = 5;
      update();
       datas = await indexService.getBoxInfo(boxIndex, pageSize);
      print(datas);
      update();
    } catch (err) {
      print('getDataBoxInfo : ' + err.toString());
    }
  }
}
