import 'package:json_annotation/json_annotation.dart';

part 'variants.g.dart';

@JsonSerializable()
class Variants {
  @JsonKey(name: 'variant_id')
  final int? variantId;
  final String? size;
  final List<Colors>? colors;
  final int? quantity;

  const Variants({
    this.variantId,
    this.size,
    this.colors,
    this.quantity,
  });

  factory Variants.fromJson(Map<String, dynamic> json) =>
      _$VariantsFromJson(json);

  Map<String, dynamic> toJson() => _$VariantsToJson(this);
}

@JsonSerializable()
class Colors {
  final String? color;
  @JsonKey(name: 'color_hex')
  final String? colorHex;

  const Colors({
    this.color,
    this.colorHex,
  });

  factory Colors.fromJson(Map<String, dynamic> json) =>
      _$ColorsFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsToJson(this);
}
