import 'package:foody/models/product_model.dart';

class CreateOrderModel {
	List cart;
	String firstName;
	String lastName;
	String email;
	String address;
	String postalCode;
	String city;
	String state;
	String phoneNumber;

	CreateOrderModel({
    required this.cart, 
    required this.firstName, 
    required this.lastName, 
    required this.email, 
    required this.address, 
    required this.postalCode, 
    required this.city, 
    required this.state, 
    required this.phoneNumber
  });

	CreateOrderModel.fromJson(Map<String, dynamic> json) :
		cart = json['cart'] == null ? [] : (json['cart'] as List).map((e) => CartModel.fromJson(e as Map<String, dynamic>)).toList(),
		firstName = json['first_name'],
		lastName = json['last_name'],
		email = json['email'],
		address = json['address'],
		postalCode = json['postal_code'],
		city = json['city'],
		state = json['state'],
		phoneNumber = json['phone_number'];


	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart'] = this.cart;
    // data['cart'] = this.cart.map((v) => v.toJson()).toList();
		data['first_name'] = this.firstName;
		data['last_name'] = this.lastName;
		data['email'] = this.email;
		data['address'] = this.address;
		data['postal_code'] = this.postalCode;
		data['city'] = this.city;
		data['state'] = this.state;
		data['phone_number'] = this.phoneNumber;
		return data;
	}
}




class CartModel {
  String productId;
  int quantity;
  String price;

  CartModel({required this.productId, required this.quantity, required this.price});

  CartModel.fromJson(Map<String, dynamic> json) :
    productId = json['product_id'],
    quantity = json['quantity'],
    price = json['price'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  } 

}



class MyCartModel {
  ProductModel product;
  int quantity;
  String price;

  MyCartModel({required this.product, required this.quantity, required this.price});

  MyCartModel.fromJson(Map<String, dynamic> json) :
    product = ProductModel.fromJson(json['product']),
    quantity = json['quantity'],
    price = json['price'];
  

  static Map<String, dynamic> toMap(MyCartModel mapItem) {
    return {
      'product' : mapItem.product,
      'quantity'  :  mapItem.quantity,
      'price' : mapItem.price
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }

}