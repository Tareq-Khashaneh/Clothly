import 'package:ecommerce_clothing/core/constants/typedef.dart';
import 'package:ecommerce_clothing/features/home/data/repositories/product_repo.dart';

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
        return products;
      }
    } catch (e) {
      print("Error in products pro ${e.toString()}");
    }
    return [];
  }

  Future<List<ProductModel>> getProductsCategory(
      {required String category}) async {
    try {
      List data =
          await _productRepo.getProductsCategory(category: category);
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
}
