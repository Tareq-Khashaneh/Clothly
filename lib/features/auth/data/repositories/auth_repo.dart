import 'dart:convert';
import 'package:ecommerce_clothing/core/constants/typedef.dart';
import '../../../../core/constants/api_endpoint.dart';
import '../../../../core/constants/error.dart';
import '../../../../networking/network_service.dart';

class AuthRepo {
  final NetworkService _networkService;

  AuthRepo({required NetworkService networkService})
      : _networkService = networkService;
  Future<parameters?> register({required parameters params}) async {
    try {
      dioRes? response =
          await _networkService.post(url: Api.register, data: params);
      if (response != null) {
        var data = response.data;
        print("register $data");
        if (response.statusCode! >= 200) {
          return data;
        }
      }
      return null;
    } catch (e) {
      print("error in AuthRepo  $e");
      return null;
    }
  }

  Future<parameters?> login({required parameters data}) async {
    try {
      dioRes? response = await _networkService.post(url: Api.login, data: data);
      print("Res $response");
      if (response != null) {
        var data = response.data;
        return data;
      }

      return null;
    } catch (e) {
      print("error in AuthRepo  $e");
      return null;
    }
  }
}
