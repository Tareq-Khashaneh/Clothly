import 'dart:convert';

import 'package:ecommerce_clothing/core/constants/typedef.dart';
import 'package:ecommerce_clothing/features/auth/data/models/login_model.dart';
import 'package:ecommerce_clothing/features/auth/data/models/register_model.dart';
import 'package:ecommerce_clothing/features/auth/data/repositories/auth_repo.dart';

class AuthProvider {
  final AuthRepo _authRepo;

  AuthProvider({required AuthRepo authRepo}) : _authRepo = authRepo;

  Future<RegisterModel?> register({required parameters params}) async {
    try {
      parameters? json = await _authRepo.register(params: params);
      print("json $json");
      if(json!= null){
        return RegisterModel.fromJson(json);
      }
    } catch (e) {
      print("error in register provider ${e.toString()}");
    }
    return null;
  }
  Future<LoginModel?> login({required parameters params}) async {
    try {
      parameters? json = await _authRepo.login(data: params);
      print("js $json");
      if(json!= null){
        return LoginModel.fromJson(json);
      }
      } catch (e) {
      print("error in login provider ${e.toString()}");
    }
    return null;
  }
}
