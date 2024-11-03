import 'package:ecommerce_clothing/core/constants/typedef.dart';
import 'package:ecommerce_clothing/features/home/data/models/rate_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String price;
  final RateModel rate;
  final String category;
  final String description;
  final String image;
  late  bool isFavorite;
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image,
      required this.rate,
      this.isFavorite = false,
      });
  factory ProductModel.fromJson(parameters json) => ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rate: RateModel.fromJson(json['rating']));
}
