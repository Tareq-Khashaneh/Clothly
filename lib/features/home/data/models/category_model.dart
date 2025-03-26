
import 'package:clothly/core/constants/typedef.dart';

class CategoryModel{
  final String id;
  final String name;

  CategoryModel({required this.id, required this.name});
  factory CategoryModel.fromJson(parameters json)
  => CategoryModel(id: json['id'].toString(), name: json['title']);
}