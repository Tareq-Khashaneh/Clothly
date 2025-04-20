


import 'package:clothly/features/home/data/models/product_model.dart';

class CartProductModel{
  final ProductModel wishlistItem;
  late int number;
  late double finalPrice;
  CartProductModel({required this.wishlistItem,required this.number,required this.finalPrice});
}