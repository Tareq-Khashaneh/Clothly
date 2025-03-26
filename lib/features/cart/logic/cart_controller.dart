

import 'package:clothly/features/product_detail/data/models/cart_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final List<CartProductModel> cartProducts = [];
  void deleteProduct({required CartProductModel wishlistItem})
  {
    cartProducts.remove(wishlistItem);
    update();
  }
  void increaseNumberOfProduct({required CartProductModel wishlistItem}) {
   var num = wishlistItem.number++;
    wishlistItem.finalPrice = double.parse(wishlistItem.wishlistItem.price!) *  num;
    update();
  }

  void decreaseNumberOfProduct({required CartProductModel wishlistItem}) {
   var num = wishlistItem.number != 1 ?  wishlistItem.number-- :  wishlistItem.number;
    wishlistItem.finalPrice = double.parse(wishlistItem.wishlistItem.price!) *  num;
    update();
  }

}