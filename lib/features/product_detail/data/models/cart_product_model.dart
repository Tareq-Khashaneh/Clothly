


import 'package:ecommerce_clothing/features/home/data/models/product_model.dart';

class CartProductModel{
  final ProductModel product;
  late int number;
  late double finalPrice;
  CartProductModel({required this.product,required this.number,required this.finalPrice});
}