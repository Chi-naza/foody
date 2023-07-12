class ProductModel {
  int id;
  CategoryModel category;
  String name;
  String slug;
  String image;
  String description;
  dynamic realPrice;
  dynamic discountPrice;
  bool available;
  String created;
  String updated;
  int views;

  ProductModel({
    required this.id,
    required this.category,
    required this.name,
    required this.slug,
    required this.image,
    required this.description,
    required this.realPrice,
    required this.discountPrice,
    required this.available,
    required this.created,
    required this.updated,
    required this.views
  });

  ProductModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    category =  CategoryModel.fromJson(json['category']),
    name = json['name'],
    slug = json['slug'],
    image = json['image'] ?? "",
    description = json['description'],
    realPrice = json['real_price'],
    discountPrice = json['discount_price'],
    available = json['available'],
    created = json['created'],
    updated = json['updated'],
    views = json['views'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['description'] = this.description;
    data['real_price'] = this.realPrice;
    data['discount_price'] = this.discountPrice;
    data['available'] = this.available;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['views'] = this.views;
    return data;
  }
}

class CategoryModel {
  int id;
  String name;
  String slug;

  CategoryModel({required this.id, required this.name, required this.slug});

  CategoryModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    slug = json['slug'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}




// Full Category Model
class FullCategoryModel {
  String name; 
  String image;

  FullCategoryModel({required this.name, required this.image});

  FullCategoryModel.fromJson(Map<String, dynamic> json) :
    name = json['name'],
    image = json['image'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
