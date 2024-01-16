class TrandingProductModel {
  TrandingProductModel({
    required this.product,
  });
  late final List<Product> product;

  TrandingProductModel.fromJson(Map<String, dynamic> json){
    product = List.from(json['product']).map((e)=>Product.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product'] = product.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Product {
  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.date,
  });
  late final String id;
  late final String category;
  late final String name;
  late final String image;
  late final String date;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    category = json['category'];
    name = json['name'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category'] = category;
    _data['name'] = name;
    _data['image'] = image;
    _data['date'] = date;
    return _data;
  }
}