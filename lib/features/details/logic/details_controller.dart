import 'package:clothly/features/cart/logic/cart_controller.dart';
import 'package:clothly/features/home/data/models/product_model.dart';
import 'package:clothly/features/product_detail/data/models/cart_product_model.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  final CartController cartController = Get.find();
  ProductModel? wishlistItem;
  int number = 1;
  late double finalPrice;
  @override
  void onInit() {
    finalPrice = 0.0;
    wishlistItem = Get.arguments;
    calculatePriceOfProduct();
    super.onInit();
  }

  void increaseNumberOfProduct() {
    number++;
    update();
  }

  void decreaseNumberOfProduct() {
    number != 1 ? number-- : number;
    update();
  }

  void calculatePriceOfProduct() {
    finalPrice = double.parse(wishlistItem!.price!) * number;
    update();
  }

  void addToCart() {
    cartController.cartProducts
        .add(CartProductModel(wishlistItem: wishlistItem!, number: number, finalPrice: finalPrice));
    print("cart ${cartController.cartProducts}");
  }
}
