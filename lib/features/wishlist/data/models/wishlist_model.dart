

import '../../../../core/constants/typedef.dart';

class WishlistModel{
  final String id;
  final String? title;
  final String? price;
  final String? description;
  final String? image;
  final String? thumbnail;
  WishlistModel(
      {required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.image,
        required this.thumbnail,
        });
  factory WishlistModel.fromJson(parameters json) => WishlistModel(
    id: json['id'].toString(),
    title: json['title'],
    price: json['price'].toString(),
    description: json['description'],
    image: json['image'],
    thumbnail: json['thumbnail'],
  );
  static List<WishlistModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WishlistModel.fromJson(json)).toList();
  }
}