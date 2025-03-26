import 'package:clothly/core/constants/typedef.dart';

import 'address_model.dart';

class UserModel {
  final String email;
  final String fullName;
  final String phone;

  factory UserModel.fromJson(parameters json) => UserModel(
      email: json['email'],
      fullName: json['full_name'],
      phone: json['phone_number'],
);

  UserModel({
    required this.email,
    required this.fullName,
    required this.phone,

  });
}
