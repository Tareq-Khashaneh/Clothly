import 'package:clothly/core/constants/typedef.dart';
import 'package:clothly/features/home/data/models/rate_model.dart';

class ProductModel {
  final String id;
  final String? title;
  final String? price;
  final String? category;
  final String? description;
  final String? image;
  final String? size;
  final String? color;
  final String? quantity;
  bool isWishlist;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.size,
    required this.color,
    required this.quantity,
    this.isWishlist = false,
    // required this.rate,
  });
  factory ProductModel.fromJson(parameters json) => ProductModel(
        id: json['id'].toString(),
        title: json['title'],
        price: json['price'].toString(),
        category: json['category_id'].toString(),
        description: json['description'],
        image: json['image'],
        size: json['size'],
        color: json['color'],
        quantity: json['stock_quantity'].toString(),
      );
}
