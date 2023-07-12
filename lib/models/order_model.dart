import 'package:foody/models/product_model.dart';

class OrderModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String address;
  String postalCode;
  String city;
  String state;
  String phoneNumber;
  String created;
  String updated;
  bool paid;
  List<ItemsModel> items;

  OrderModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.phoneNumber,
    required this.created,
    required this.updated,
    required this.paid,
    required this.items
  });

  OrderModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    firstName = json['first_name'],
    lastName = json['last_name'],
    email = json['email'],
    address = json['address'],
    postalCode = json['postal_code'],
    city = json['city'],
    state = json['state'],
    phoneNumber = json['phone_number'],
    created = json['created'],    // DateFormat('MM/dd/yy').parse(json['created']).,
    updated = json['updated'],
    paid = json['paid'],
    items = json['items'] == null? [] : (json['items'] as List).map((e) => ItemsModel.fromJson(e as Map<String, dynamic>)).toList();
    
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['postal_code'] = this.postalCode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['phone_number'] = this.phoneNumber;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['paid'] = this.paid;
    data['items'] = this.items;

    return data;
  }
}

class ItemsModel {
  int id;
  int product;
  String price;
  int quantity;

  ItemsModel({required this.id, required this.product, required this.price, required this.quantity});

  ItemsModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    product = json['product'],
    price = json['price'],
    quantity = json['quantity'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.product;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }

}





class OrderRefurbishedModel {
  String orderID;
  String price;
  int quantity;
  String createdAt;
  ProductModel product;

  OrderRefurbishedModel({required this.orderID, required this.price, required this.quantity, required this.product, required this.createdAt});
}
