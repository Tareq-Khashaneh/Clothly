import 'dart:convert';

import 'package:clothly/core/constants/typedef.dart';
import '../../../../core/constants/api_endpoint.dart';
import '../../../../networking/network_service.dart';

class ProductRepo {
  final NetworkService _networkService;

  ProductRepo({required NetworkService networkService})
      : _networkService = networkService;
  Future<List> getAllProducts() async {
    try {
      dioRes response = await _networkService.get(url: Api.products);
      if (response.statusCode == 200) {
        return response.data['products'];
      }
      return [];
    } catch (e) {
      print("error in category repo  $e");
      return [];
    }
  }

  Future<List> getProductsForCategory({required String id}) async {
    try {
      dioRes response = await _networkService.get(url: "${Api.categories}/$id");
      if (response.statusCode == 200) {
        return response.data['products'];
      }
      return [];
    } catch (e) {
      print("error in ProductRepo categories for wishlistItem $e");
      return [];
    }
  }
  Future<bool> addProductToWishlist({required String productId})async{
    try {
      dioRes response = await _networkService.post(url: Api.wishlist,data: {'product_id':productId});
      print("response $response");
      if (response.statusCode == 201 && response.data['message'] == "wishlistItem added to wishlist") {
        return true;
      }
    } catch (e) {
      print("error in ProductRepo categories for wishlistItem $e");
    }
    return false;
  }
  Future<bool> removeProductFromWishlist({required String productId})async{
    try {
      dioRes response = await _networkService.delete(url: "${Api.wishlist}/$productId");
      print("response $response");
      if (response.statusCode == 200 && response.data['message'] == "wishlistItem removed from wishlist") {
        return true;
      }
    } catch (e) {
      print("error in ProductRepo categories for wishlistItem $e");
    }
    return false;
  }
}
