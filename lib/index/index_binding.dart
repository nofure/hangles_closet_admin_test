import 'package:get/get.dart';

class IndexBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndexBinding());
  }
}