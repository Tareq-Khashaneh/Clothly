

import 'package:ecommerce_clothing/features/bottom_navigation/logic/bottom_nav_controller.dart';
import 'package:get/get.dart';


class BottomNavBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
  }
}