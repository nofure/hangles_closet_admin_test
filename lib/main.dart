import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangles_closet_admin/index/index_binding.dart';
import 'package:hangles_closet_admin/index/index_view.dart';

void main() {
 runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => IndexView(), binding: IndexBinding()),
    ],
  ));
}
