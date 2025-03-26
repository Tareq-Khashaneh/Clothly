import 'package:clothly/core/constants/typedef.dart';
import 'package:clothly/features/home/data/repositories/product_repo.dart';

import '../models/product_model.dart';

class ProductPro {
  final ProductRepo _productRepo;

  ProductPro({required ProductRepo productRepo}) : _productRepo = productRepo;
  Future<List<ProductModel>> getAllProducts() async {
    try {
      List productsMaps = await _productRepo.getAllProducts();
      if (productsMaps != []) {
        List<ProductModel> products = [];
        for (var pm in productsMaps) {
          products.add(ProductModel.fromJson(pm));
        }
        print("products $products");
        return products;
      }
    } catch (e) {
      print("Error in products pro ${e.toString()}");
    }
    return [];
  }

  Future<List<ProductModel>> getProductsForCategory(
      {required String id}) async {
    try {
      List data = await _productRepo.getProductsForCategory(id: id);
      if (data != []) {
        List<ProductModel> products = [];
        for (var pm in data) {
          products.add(ProductModel.fromJson(pm));
        }
        return products;
      }
    } catch (e) {
      print("error in ProductRepo  $e");
      return [];
    }
    return [];
  }

  Future<bool> addProductToWishlist({required String productId}) async {
    try {
      return await _productRepo.addProductToWishlist(productId: productId);
    } catch (e) {
      print("error in ProductRepo  $e");
    }
    return false;
  }

  Future<bool> removeProductFromWishlist({required String productId}) async {
    try {
      bool b =
          await _productRepo.removeProductFromWishlist(productId: productId);
      return b;
    } catch (e) {
      print("error in ProductRepo  $e");
    }
    return false;
  }
}
