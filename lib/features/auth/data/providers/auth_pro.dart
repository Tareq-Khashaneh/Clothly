import 'dart:convert';

import 'package:clothly/core/constants/typedef.dart';
import 'package:clothly/features/auth/data/models/user_model.dart';
import 'package:clothly/features/auth/data/repositories/auth_repo.dart';

class AuthProvider {
  final AuthRepo _authRepo;

  AuthProvider({required AuthRepo authRepo}) : _authRepo = authRepo;

  Future<parameters?> signup({required parameters params}) async {
    try {
      parameters? json = await _authRepo.signup(params: params);
      print("json $json");
      if(json!= null){
        return {'user':UserModel.fromJson(json),
        'token': json['user']['token'],
        };
      }
    } catch (e) {
      print("error in signup provider ${e.toString()}");
    }
    return null;
  }
  Future<parameters?> login({required parameters params}) async {
    try {
      parameters? json = await _authRepo.login(data: params);
      print("js $json");
      if(json!= null){
        return {'user':UserModel.fromJson(json['user']),
          'token': json['user']['token'],
        };
      }
      } catch (e) {
      print("error in login provider ${e.toString()}");
    }
    return null;
  }
}
