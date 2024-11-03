import 'package:get/get.dart';

import '../../home/data/models/product_model.dart';

class WishlistController extends GetxController{
  List<ProductModel> wishlist = [];
void removeFromWishList({required ProductModel product}){
  wishlist.remove(product);
  update();
}
}