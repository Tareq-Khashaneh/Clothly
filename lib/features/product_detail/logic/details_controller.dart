import 'package:ecommerce_clothing/features/cart/logic/cart_controller.dart';
import 'package:ecommerce_clothing/features/home/data/models/product_model.dart';
import 'package:ecommerce_clothing/features/product_detail/data/models/cart_product_model.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  final CartController cartController = Get.find();
  ProductModel? product;
  int number = 1;
  late double finalPrice;
  @override
  void onInit() {
    finalPrice = 0.0;
    product = Get.arguments;
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
    finalPrice = double.parse(product!.price) * number;
    update();
  }

  void addToCart() {
    cartController.cartProducts
        .add(CartProductModel(product: product!, number: number, finalPrice: finalPrice));
    print("cart ${cartController.cartProducts}");
  }
}
