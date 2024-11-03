import 'package:ecommerce_clothing/features/cart/logic/cart_controller.dart';
import 'package:get/get.dart';

class CartBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController(), permanent: true);
  }
}
