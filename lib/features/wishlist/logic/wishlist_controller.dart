import 'package:clothly/features/home/data/repositories/product_repo.dart';
import 'package:clothly/features/service/app_service.dart';
import 'package:clothly/features/wishlist/data/models/wishlist_model.dart';
import 'package:clothly/features/wishlist/data/providers/wishlist_pro.dart';
import 'package:clothly/features/wishlist/data/repositories/wishlist_repo.dart';
import 'package:get/get.dart';

import '../../home/data/models/product_model.dart';
import '../../home/data/providers/products_pro.dart';

class WishlistController extends GetxController{
  List<WishlistModel> wishlistItems = [];
  late WishlistPro _wishlistPro;
  AppService appService = Get.find();
  @override
  void onInit() {
    super.onInit();
    _wishlistPro = WishlistPro(wishlistRepo: WishlistRepo(networkService: appService.networkService));
    fetchWishlistItems();
  }
  void fetchWishlistItems()async{
   wishlistItems =  await _wishlistPro.getAllWishlistItems();
  update();
  }
  void removeFromWishList(WishlistModel wishlistItem)async{
    await _wishlistPro.removeProductFromWishlist(productId: wishlistItem.id);
    wishlistItems.remove(wishlistItem);
    update();
  }

}