

import 'package:ecommerce_clothing/core/constants/typedef.dart';

class RateModel {
  final String rate;
  final int count;

  RateModel({required this.rate, required this.count});
  factory RateModel.fromJson(parameters json)
  => RateModel(rate: json['rate'].toString(), count: json['count']);
}