

import 'package:ecommerce_clothing/features/product_detail/data/models/cart_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final List<CartProductModel> cartProducts = [];
  void deleteProduct({required CartProductModel product})
  {
    cartProducts.remove(product);
    update();
  }
  void increaseNumberOfProduct({required CartProductModel product}) {
   var num = product.number++;
    product.finalPrice = double.parse(product.product.price) *  num;
    update();
  }

  void decreaseNumberOfProduct({required CartProductModel product}) {
   var num = product.number != 1 ?  product.number-- :  product.number;
    product.finalPrice = double.parse(product.product.price) *  num;
    update();
  }

}