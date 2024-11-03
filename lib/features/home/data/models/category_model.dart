
import 'package:ecommerce_clothing/core/constants/typedef.dart';

class Category{
  final int id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});
  factory Category.fromJson(parameters json)
  => Category(id: json['id'], name: json['name'], image: json['image']);
}