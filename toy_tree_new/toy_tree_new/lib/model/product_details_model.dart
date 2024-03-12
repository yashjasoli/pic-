class ProductDetailsModel {
  ProductDetailsModel({
    required this.productDetails,
  });
  late final List<ProductDetails> productDetails;

  ProductDetailsModel.fromJson(Map<String, dynamic> json){
    productDetails = List.from(json['product_details']).map((e)=>ProductDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_details'] = productDetails.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProductDetails {
  ProductDetails({
    required this.id,
    required this.productId,
    required this.productName,
    required this.dimensions,
    required this.battery,
    required this.recommended,
    required this.skills,
    required this.gender,
    required this.age,
    required this.brand,
    required this.description,
    required this.date,
    required this.imgurl,
  });
  late final String id;
  late final String productId;
  late final String productName;
  late final String dimensions;
  late final String battery;
  late final String recommended;
  late final String skills;
  late final String gender;
  late final String age;
  late final String brand;
  late final String description;
  late final String date;
  late final List<Imgurl> imgurl;

  ProductDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    dimensions = json['dimensions'];
    battery = json['battery'];
    recommended = json['recommended'];
    skills = json['skills'];
    gender = json['gender'];
    age = json['age'];
    brand = json['brand'];
    description = json['description'];
    date = json['date'];
    imgurl = List.from(json['imgurl']).map((e)=>Imgurl.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['dimensions'] = dimensions;
    _data['battery'] = battery;
    _data['recommended'] = recommended;
    _data['skills'] = skills;
    _data['gender'] = gender;
    _data['age'] = age;
    _data['brand'] = brand;
    _data['description'] = description;
    _data['date'] = date;
    _data['imgurl'] = imgurl.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Imgurl {
  Imgurl({
    required this.url,
  });
  late final String url;

  Imgurl.fromJson(Map<String, dynamic> json){
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
  }
}
// cagegry
// availbe