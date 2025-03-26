
import 'package:clothly/features/home/logic/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}