/// id : 8
/// total_quantity : 20
/// total_price : 440
/// cart_items : [{"quantity":20,"price":22,"product":{"title":"Dress","price":22,"image":"http://localhost:8000/storage/products/images/1744148061_67f5965da29e1.jpg","thumbnail":"http://localhost:8000/storage/products/thumbnails/1744148061_67f5965da29e1.jpg"}}]

class Cart {
  Cart({
      num id, 
      num totalQuantity, 
      num totalPrice, 
      List<CartItems> cartItems,}){
    _id = id;
    _totalQuantity = totalQuantity;
    _totalPrice = totalPrice;
    _cartItems = cartItems;
}

  Cart.fromJson(dynamic json) {
    _id = json['id'];
    _totalQuantity = json['total_quantity'];
    _totalPrice = json['total_price'];
    if (json['cart_items'] != null) {
      _cartItems = [];
      json['cart_items'].forEach((v) {
        _cartItems.add(CartItems.fromJson(v));
      });
    }
  }
  num _id;
  num _totalQuantity;
  num _totalPrice;
  List<CartItems> _cartItems;
Cart copyWith({  num id,
  num totalQuantity,
  num totalPrice,
  List<CartItems> cartItems,
}) => Cart(  id: id ?? _id,
  totalQuantity: totalQuantity ?? _totalQuantity,
  totalPrice: totalPrice ?? _totalPrice,
  cartItems: cartItems ?? _cartItems,
);
  num get id => _id;
  num get totalQuantity => _totalQuantity;
  num get totalPrice => _totalPrice;
  List<CartItems> get cartItems => _cartItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['total_quantity'] = _totalQuantity;
    map['total_price'] = _totalPrice;
    if (_cartItems != null) {
      map['cart_items'] = _cartItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// quantity : 20
/// price : 22
/// product : {"title":"Dress","price":22,"image":"http://localhost:8000/storage/products/images/1744148061_67f5965da29e1.jpg","thumbnail":"http://localhost:8000/storage/products/thumbnails/1744148061_67f5965da29e1.jpg"}

class CartItems {
  CartItems({
      num quantity, 
      num price, 
      Product product,}){
    _quantity = quantity;
    _price = price;
    _product = product;
}

  CartItems.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _price = json['price'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num _quantity;
  num _price;
  Product _product;
CartItems copyWith({  num quantity,
  num price,
  Product product,
}) => CartItems(  quantity: quantity ?? _quantity,
  price: price ?? _price,
  product: product ?? _product,
);
  num get quantity => _quantity;
  num get price => _price;
  Product get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['price'] = _price;
    if (_product != null) {
      map['product'] = _product.toJson();
    }
    return map;
  }

}

/// title : "Dress"
/// price : 22
/// image : "http://localhost:8000/storage/products/images/1744148061_67f5965da29e1.jpg"
/// thumbnail : "http://localhost:8000/storage/products/thumbnails/1744148061_67f5965da29e1.jpg"

class Product {
  Product({
      String title, 
      num price, 
      String image, 
      String thumbnail,}){
    _title = title;
    _price = price;
    _image = image;
    _thumbnail = thumbnail;
}

  Product.fromJson(dynamic json) {
    _title = json['title'];
    _price = json['price'];
    _image = json['image'];
    _thumbnail = json['thumbnail'];
  }
  String _title;
  num _price;
  String _image;
  String _thumbnail;
Product copyWith({  String title,
  num price,
  String image,
  String thumbnail,
}) => Product(  title: title ?? _title,
  price: price ?? _price,
  image: image ?? _image,
  thumbnail: thumbnail ?? _thumbnail,
);
  String get title => _title;
  num get price => _price;
  String get image => _image;
  String get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['price'] = _price;
    map['image'] = _image;
    map['thumbnail'] = _thumbnail;
    return map;
  }

}