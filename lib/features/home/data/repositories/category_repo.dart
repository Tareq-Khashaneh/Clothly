import 'package:clothly/networking/network_service.dart';

import '../../../../core/constants/api_endpoint.dart';
import '../../../../core/constants/typedef.dart';

class CategoryRepo {
  final NetworkService _networkService;

  CategoryRepo({required NetworkService networkService})
      : _networkService = networkService;

  Future<List> getAllCategories() async {
    try {
      dioRes response = await _networkService.get(url: Api.categories);
      if (response.statusCode == 200) {
        return response.data['data'];
      }

      return [];
    } catch (e) {
      print("error in ProductRepo  $e");
      return [];
    }
  }
}
