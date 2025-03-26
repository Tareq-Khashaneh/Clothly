import 'package:clothly/features/auth/data/models/user_model.dart';
import 'package:clothly/features/auth/logic/auth_controller.dart';
import 'package:clothly/features/home/data/models/category_model.dart';
import 'package:clothly/features/home/data/providers/products_pro.dart';
import 'package:clothly/features/home/data/repositories/category_repo.dart';
import 'package:clothly/features/home/data/repositories/product_repo.dart';
import 'package:clothly/features/service/app_service.dart';
import 'package:clothly/features/wishlist/data/models/wishlist_model.dart';
import 'package:clothly/features/wishlist/data/providers/wishlist_pro.dart';
import 'package:clothly/features/wishlist/data/repositories/wishlist_repo.dart';
import 'package:clothly/features/wishlist/logic/wishlist_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/constants/enum_state.dart';
import '../data/models/product_model.dart';
import '../data/providers/category_pro.dart';

class HomeController extends GetxController {
  late UserModel? user;
  late ProductPro _productPro;
  late WishlistPro _wishlistPro;
  late CategoryPro _categoryPro;
  final AppService appService = Get.find();
  late List<ProductModel> products;
  late List<ProductModel> filterProducts;
  late List<CategoryModel> categories;
  late Status state;
  late Status stateCategories;
  late int selectedIndex;
  late TextEditingController searchController;
  final WishlistController wishlistController = Get.find();
  final AuthController authController = Get.find();
  @override
  void onInit() {
    super.onInit();
    init();
    getAllCategories();
    getAllProducts();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> toggleFavorite({required ProductModel product}) async {
    if (!product.isWishlist) {
      await _productPro.addProductToWishlist(productId: product.id);
      product.isWishlist = true;
    } else {
      await _productPro.removeProductFromWishlist(productId: product.id);
      product.isWishlist = false;
    }
    update();
  }
  Future<void> getAllProducts() async {
    state = Status.loading;
    products = await _productPro.getAllProducts();
    List<WishlistModel> wishlistItems = await _wishlistPro.getAllWishlistItems();
    Map<String, bool> wishlistMap = {for (var item in wishlistItems) item.id: true};

    // Mark products as favorite if they exist in the wishlistMap
    for (var product in products) {
      product.isWishlist = wishlistMap.containsKey(product.id);
      print("product is wishlist ${product.isWishlist}");
    }
    filterProducts = products;
    filterProducts != [] ? state = Status.success : state = Status.failed;
    update();
  }

  Future<void> getAllCategories() async {
    stateCategories = Status.loading;
    categories = await _categoryPro.getAllCategories();
    categories != [] ? stateCategories = Status.success : Status.failed;
    print("categories $categories");
    update();
  }


  void searchProducts(String query, {String? categoryId}) {
    query = query.toLowerCase();
    if(query.isEmpty){
      print("here");
      filterProducts = products;
    }
   filterProducts =  products.where((product) {
      return product.title!.toLowerCase().contains(query) ;
      // ||
          // product.description!.toLowerCase().contains(query);
    }).toList();
     print("product $products");
     update();
  }


  void getProductsForCategory({required String id}) async {
    state = Status.loading;
    searchController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    products = await _productPro.getProductsForCategory(id: id);
    products != [] ? state = Status.success : state = Status.failed;
    filterProducts = products;
    update();
  }
  init() {
    user = appService.currentUser;
    searchController = TextEditingController();
    selectedIndex = 0;
    products = [];
    categories = [];
    _categoryPro = CategoryPro(
        categoryRepo: CategoryRepo(networkService: appService.networkService));
    _productPro = ProductPro(
        productRepo: ProductRepo(networkService: appService.networkService));
    _wishlistPro = WishlistPro(
        wishlistRepo: WishlistRepo(networkService: appService.networkService));
  }

}
