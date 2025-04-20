

import 'package:clothly/features/product_detail/logic/details_controller.dart';
import 'package:get/get.dart';

class DetailsBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController());
  }
}