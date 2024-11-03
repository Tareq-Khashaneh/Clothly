import 'dart:convert';
import 'package:ecommerce_clothing/core/constants/typedef.dart';
import '../../../../core/constants/api_endpoint.dart';
import '../../../../core/constants/error.dart';
import '../../../../networking/network_service.dart';

class ProductRepo {
  final NetworkService _networkService;

  ProductRepo({required NetworkService networkService})
      : _networkService = networkService;
  Future<List> getAllProducts() async {
    try {
      dioRes? response = await _networkService.get(url: Api.products);
      if (response != null) {
        if (response.statusCode == 200) {
          var data = response.data;

          return data;
        }
      }
      return [];
    } catch (e) {
      print("error in ProductRepo  $e");
      return [];
    }
  }
  Future<List> getProductsCategory({required String category}) async {
    try {
      dioRes? response = await _networkService.get(url: "${Api.category}/$category");
      if (response != null) {
        if (response.statusCode == 200) {
          List<String> categories = [];
          var data = response.data;
          return data;
        }
      }
      return [];
    } catch (e) {
      print("error in ProductRepo  $e");
      return [];
    }
  }
}
