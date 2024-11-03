

import 'package:ecommerce_clothing/core/constants/typedef.dart';

class Address {
  final String city;
  final String street;
  final int number;
  final String zipcode;

  Address({required this.city, required this.street, required this.number, required this.zipcode});
  factory Address.fromJSon(parameters json)
  => Address(city: json['city'], street: json['street'], number: json['number'], zipcode: json['zipcode']);
}