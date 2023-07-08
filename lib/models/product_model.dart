class ProductModel {
  int id;
  Category category;
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
    category =  Category.fromJson(json['category']),
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

class Category {
  int id;
  String name;
  String slug;

  Category({required this.id, required this.name, required this.slug});

  Category.fromJson(Map<String, dynamic> json) :
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
