


import 'package:ecommerce_clothing/features/wishlist/logic/wishlist_controller.dart';
import 'package:get/get.dart';

class WishlistBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(WishlistController(),permanent: true);
  }
}