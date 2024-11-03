



import 'package:ecommerce_clothing/core/constants/typedef.dart';

class LoginModel {
  final String token;

  LoginModel({required this.token});
  factory LoginModel.fromJson(parameters json)
  => LoginModel(token: json['token']);
}