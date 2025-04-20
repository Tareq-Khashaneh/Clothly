/// product_variant_id : 1
/// quantity : 10

class CartItemRequestModel {
  CartItemRequestModel({
      num productVariantId, 
      num quantity,}){
    _productVariantId = productVariantId;
    _quantity = quantity;
}

  CartItemRequestModel.fromJson(dynamic json) {
    _productVariantId = json['product_variant_id'];
    _quantity = json['quantity'];
  }
  num _productVariantId;
  num _quantity;
CartItemRequestModel copyWith({  num productVariantId,
  num quantity,
}) => CartItemRequestModel(  productVariantId: productVariantId ?? _productVariantId,
  quantity: quantity ?? _quantity,
);
  num get productVariantId => _productVariantId;
  num get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_variant_id'] = _productVariantId;
    map['quantity'] = _quantity;
    return map;
  }

}