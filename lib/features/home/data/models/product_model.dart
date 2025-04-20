import 'package:json_annotation/json_annotation.dart';

part 'product_2.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'product_id')
  final int? productId;
  final String? title;
  final dynamic description;
  final String? image;
  final int? price;
  final String? category;
  final List<Variants>? variants;

  const ProductModel({
    this.productId,
    this.title,
    this.description,
    this.image,
    this.price,
    this.category,
    this.variants,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$Product2FromJson(json);

  Map<String, dynamic> toJson() => _$Product2ToJson(this);
}

@JsonSerializable()
class Variants {
  @JsonKey(name: 'variant_id')
  final int? variantId;
  final String? size;
  final String? color;
  @JsonKey(name: 'color_hex')
  final String? colorHex;
  final int? quantity;

  const Variants({
    this.variantId,
    this.size,
    this.color,
    this.colorHex,
    this.quantity,
  });

  factory Variants.fromJson(Map<String, dynamic> json) =>
      _$VariantsFromJson(json);

  Map<String, dynamic> toJson() => _$VariantsToJson(this);
}
