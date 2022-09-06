import 'package:get/get.dart';

import '../controllers/bottom_navigatio_screen_controller.dart';

class BottomNavigatioScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigatioScreenController>(
      () => BottomNavigatioScreenController(),
    );
  }
}
