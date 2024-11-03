import 'package:ecommerce_clothing/features/home/data/providers/products_pro.dart';
import 'package:ecommerce_clothing/features/home/data/repositories/category_repo.dart';
import 'package:ecommerce_clothing/features/home/data/repositories/product_repo.dart';
import 'package:ecommerce_clothing/features/service/app_service.dart';
import 'package:ecommerce_clothing/features/wishlist/logic/wishlist_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constants/enum_state.dart';
import '../data/models/product_model.dart';

class HomeController extends GetxController {
  late ProductPro _productPro;
  late CategoryRepo _categoryRepo;
  final AppService appService = Get.find();
  late List<ProductModel> products;
  late List<ProductModel> filterProducts;
  late List<ProductModel> electronicsProducts;
  late List<ProductModel> jeweleryProducts;
  late List<ProductModel> menClothingProducts;
  late List<ProductModel> womenClothingProducts;
  late List<String> categories;
  late Status state;
  late Status stateCategories;
  late int _selectedIndex;
  late TextEditingController searchController;
  final WishlistController wishlistController = Get.find();
  @override
  void onInit() {
    init();
    getAllCategories();
    getAllProducts();
    super.onInit();
  }

  init() {
    searchController = TextEditingController();
    _selectedIndex = 0;
    state = Status.loading;
    stateCategories = Status.loading;
    products = [];
    categories = [];
    _categoryRepo = CategoryRepo(networkService: appService.networkService);
    _productPro = ProductPro(
        productRepo: ProductRepo(networkService: appService.networkService));
  }

  void addToWishlist({required ProductModel product}){
    wishlistController.wishlist.add(product);
    print("wish ${wishlistController.wishlist}");
  }

  Future<void> toggleFavorite({required ProductModel product}) async {
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      wishlistController.wishlist.add(product);
    } else {
      wishlistController.wishlist.remove(product);
    }
    update();
    // await _saveFavorites();
  }
  void removeFromWishlist({required ProductModel product}){
    wishlistController.wishlist.remove(product);
    print("wish ${wishlistController.wishlist}");
  }
  Future<void> getAllProducts() async {
    products = await _productPro.getAllProducts();
    filterProducts = products;
    filterProducts != [] ? state = Status.success : state = Status.failed;
    update();
  }

  Future<void> getAllCategories() async {
    categories = await _categoryRepo.getAllCategories();
    products != []
        ? stateCategories = Status.success
        : stateCategories = Status.failed;
    update();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  void search({required var value}) {
    switch (_selectedIndex) {
      case 0:
        filterProducts = products
            .where((element) => element.title.toLowerCase().contains(value))
            .toList();
        break;
      case 1:
        filterProducts = electronicsProducts
            .where((element) => element.title.toLowerCase().contains(value))
            .toList();
        break;
      case 2:
        filterProducts = jeweleryProducts
            .where((element) => element.title.toLowerCase().contains(value))
            .toList();
        break;
      case 3:
        filterProducts = menClothingProducts
            .where((element) => element.title.toLowerCase().contains(value))
            .toList();
        break;
      case 4:
        filterProducts = womenClothingProducts
            .where((element) => element.title.toLowerCase().contains(value))
            .toList();
        break;
    }

    update();
  }

  void getProductsCategory({required int index}) async {
    state = Status.loading;
    _selectedIndex = index;
    searchController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    switch (index) {
      case 0:
        filterProducts = await _productPro.getAllProducts();
        filterProducts != [] ? state = Status.success : state = Status.failed;
        break;
      case 1:
        electronicsProducts =
            await _productPro.getProductsCategory(category: "electronics");
        filterProducts = electronicsProducts;
        filterProducts != []
            ? state = Status.success
            : state = Status.failed;
        break;
      case 2:
        jeweleryProducts =
            await _productPro.getProductsCategory(category: "jewelery");
        filterProducts = jeweleryProducts;
        filterProducts != [] ? state = Status.success : state = Status.failed;
        break;
      case 3:
        menClothingProducts =
            await _productPro.getProductsCategory(category: "men's clothing");
        filterProducts = menClothingProducts;
        filterProducts != []
            ? state = Status.success
            : state = Status.failed;
        break;

      case 4:
        womenClothingProducts =
            await _productPro.getProductsCategory(category: "women's clothing");
        filterProducts = womenClothingProducts;

        filterProducts != []
            ? state = Status.success
            : state = Status.failed;
        break;
    }

    update();
  }
}
