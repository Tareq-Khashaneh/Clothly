
import 'package:clothly/features/home/logic/home_controller.dart';
import 'package:clothly/features/profile/logic/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}