import 'dart:convert';

import 'package:clothly/core/constants/typedef.dart';
import '../../../../core/constants/api_endpoint.dart';
import '../../../../networking/network_service.dart';

class ProfileRepo {
  final NetworkService _networkService;

  ProfileRepo({required NetworkService networkService})
      : _networkService = networkService;
  Future<parameters> updateProfile(parameters data) async {
    try {
      dioRes response =
          await _networkService.update(url: Api.profile, data: data);
      if (response.statusCode == 200 && response.data['message'] == 'success') {
        return response.data['user'];
      }
    } catch (e) {
      print("profile update ${e.toString()}");
    }
    return {};
  }
}
