import 'dart:convert';
import 'package:foody/models/create_order_model.dart';

class CartHelperMethods {

    static String encode(List<MyCartModel> cartItemsList) => jsonEncode(
        cartItemsList.map<Map<String, dynamic>>((cartItem) => MyCartModel.toMap(cartItem)).toList(),
    );

  static List<MyCartModel> decode(String cartItems) =>
    (jsonDecode(cartItems) as List<dynamic>).map<MyCartModel>((item) => MyCartModel.fromJson(item)).toList(); 


}