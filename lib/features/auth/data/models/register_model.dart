import 'package:ecommerce_clothing/core/constants/typedef.dart';

import 'address_model.dart';

class RegisterModel {
  final String email;
  final String username;
  final String firstname;
  final String lastname;
  final Address address;
  final String phone;

  factory RegisterModel.fromJson(parameters json) => RegisterModel(
      email: json['email'],
      username: json['username'],
      firstname: json['name']['firstname'],
      lastname: json['name']['lastname'],
      phone: json['phone'],
      address: Address.fromJSon(json['address']));

  RegisterModel({
    required this.email,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.address,
    required this.phone,
  });
}
