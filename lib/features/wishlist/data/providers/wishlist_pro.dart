import 'package:clothly/features/wishlist/data/models/wishlist_model.dart';
import 'package:clothly/features/wishlist/data/repositories/wishlist_repo.dart';

class WishlistPro {
  final WishlistRepo _wishlistRepo;

  WishlistPro({required WishlistRepo wishlistRepo})
      : _wishlistRepo = wishlistRepo;
  Future<List<WishlistModel>> getAllWishlistItems() async {
    try {
      List wishlistItems = await _wishlistRepo.getAllWishlistItems();
      if (wishlistItems != []) {
        return WishlistModel.fromJsonList(wishlistItems);
      }
    } catch (e) {
      print("error in wishlist pro ${e.toString()}");
    }
    return [];
  }
  Future<bool> removeProductFromWishlist({required String productId}) async {
    try {
      bool b =
      await _wishlistRepo.removeProductFromWishlist(productId: productId);
      return b;
    } catch (e) {
      print("error in ProductRepo  $e");
    }
    return false;
  }
}
