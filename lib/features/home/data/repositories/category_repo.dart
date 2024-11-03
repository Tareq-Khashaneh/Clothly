import 'package:ecommerce_clothing/networking/network_service.dart';

import '../../../../core/constants/api_endpoint.dart';
import '../../../../core/constants/typedef.dart';

class CategoryRepo {
  final NetworkService _networkService;

  CategoryRepo({required NetworkService networkService})
      : _networkService = networkService;

  Future<List<String>> getAllCategories() async {
    try {
      dioRes? response = await _networkService.get(url: Api.categories);
      if (response != null) {
        if (response.statusCode == 200) {
          List<String> categories = [];
          var data = response.data;
          for(var c in data){
            categories.add(c.toString());
          }
          return categories;
        }
      }
      return [];
    } catch (e) {
      print("error in ProductRepo  $e");
      return [];
    }
  }

}
