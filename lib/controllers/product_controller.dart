import 'package:flutter/foundation.dart';
import 'package:foody/constants/cart_helper_methods.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/data/api/api_endpoints.dart';
import 'package:foody/data/api/helper_methods.dart';
import 'package:foody/locals/local_data.dart';
import 'package:foody/models/create_order_model.dart';
import 'package:foody/models/order_model.dart';
import 'package:foody/models/product_model.dart';
import 'package:foody/screens/payments/payment_screen.dart';
import 'package:foody/widgets/progress_dialog.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  // All products
  final allGroceryProductsList = <ProductModel>[].obs;
  // All categories
  final allCategoryList = <CategoryModel>[].obs;
  final allCategoryFullList = <FullCategoryModel>[].obs;
  // Cart
  final cartProductsList = <MyCartModel>[].obs;
  // Orders
  final allOrderedProductsList = <OrderModel>[].obs;
  final allOrdersList = <OrderRefurbishedModel>[].obs;

  @override
  void onReady() {
    fetchAllGroceryProducts();
    super.onReady();
  }


  final authController = Get.find<AuthController>();



  Future<void> fetchAllGroceryProducts() async {
    // Getting the products
    Response response = await HelperAPIMethods.getDataWithHeader(FoodyAPI.BASE_URL + FoodyAPI.productsListEndpoint);

    if(response.statusCode==200){
      // A helper list variable
      List<ProductModel> productsList = [];
      productsList.clear();

      // Looping through the response
      for(var p in response.body){
        // Adding each data to our helper list
        productsList.add(ProductModel.fromJson(p));
      }

      // populating our ALL - PRODUCTS list
      allGroceryProductsList.assignAll(productsList);
      if(kDebugMode) print('ALL PRODUCTS RESPONSE: $allGroceryProductsList');

      // call a function to fetch product categories
      await fetchAllProductCategories();

       // Fetching ordered items of the current user
      await fetchAllOrderedProducts();

      // Retrieve cart items from locals
      retrieveCartItemsFromLocals();
     
    }else {
      if(kDebugMode) print("FAILED TO FETCH PRODUCTS . . .");
    }
  }




  // Fetching Categories
  Future<void> fetchAllProductCategories() async {
    // Getting the Categories
    Response response = await HelperAPIMethods.getDataWithHeader(FoodyAPI.BASE_URL + FoodyAPI.categoryListEndpoint);

    if(response.statusCode==200){
      // A helper list variable
      List<CategoryModel> productCategoryList = [];
      productCategoryList.clear();

      // Looping through the response
      for(var cat in response.body){
        // Adding each data to our helper list
        productCategoryList.add(CategoryModel.fromJson(cat));
      }

      // populating our ALL - CATEGORIES list
      allCategoryList.assignAll(productCategoryList);
      if(kDebugMode) print('ALL CATEGORIES RESPONSE: $allCategoryList');

      allCategoryFullList.clear();

      // Assigning data to allCat FULL list
      for(var cat in allCategoryList){
        var fullCatItem = FullCategoryModel(name: cat.name, image: '');
        allCategoryFullList.add(fullCatItem);        
      }

      print("FULL CATEGORY LIST: $allCategoryFullList");     

      // Getting full category list
      for(var cat in allCategoryFullList){
        // for each category we go check the whole products
        for(var p in allGroceryProductsList){
          // if any product has same catName as category and the image is empty, we update image field
          if(cat.image=="" && cat.name==p.category.name){
            cat.image = p.image; print('IMAGE - ${cat.image}');
          }
        }
      }
      
    } else {
      if(kDebugMode) print("FAILED TO FETCH PRODUCT CATEGORIES . . .");
    }

  }


  // Get products that will be in different categories: 
  List<ProductModel> fetchProductsOfDifferentCategories(String categoryName) {
    var specificProducts = <ProductModel>[];
    for(var prod in allGroceryProductsList){
      if(prod.category.name == categoryName){
        specificProducts.add(prod);
      }
    }
    print("SPECIFIC LIST: $specificProducts");
    return specificProducts;
  }



  //////////// CART SECCTION  ////////////////////////////////
  
  // Method: Add product to cart
  void addProductToCart({required ProductModel product, required int quantity, required String totalPrice}) {
    // creating a typical MyCartModel object
    var cartItem = MyCartModel(product: product, quantity: quantity, price: totalPrice);

    // Loop through the cartList to weed out duplicate items
    for(var c in cartProductsList){
      if(c.product.name == cartItem.product.name){
        authController.showSweetToast(message: 'Already added this product to your cart !', isSuccess: false);
        return;
      }
    }
    // Added product
    cartProductsList.add(cartItem);
    // Save cart items to locals
    saveCartItemsToLocals();
    // show feedback
    authController.showSweetToast(message: 'Added to cart');
    if(kDebugMode) print('CART LIST: $cartProductsList');
  }



// A method to format figures to money
String formatToMoney(String amount){
  final amountInDecimal = double.parse(amount);
  MoneyFormatter mfInstance = MoneyFormatter(amount: amountInDecimal);
  return mfInstance.output.withoutFractionDigits;
}



// A method to calculate and return the total amount of the products in the cart
String calculateCartProductsTotalPrice() {
  double amount = 0;
  for(var c in cartProductsList){
    amount += double.parse(c.price);
  }
  return formatToMoney(amount.toString());
}



// Remove product from cart
void removeProductFromCart(int index){
  cartProductsList.removeAt(index);
  // saving the current list values to locals
  saveCartItemsToLocals();
  if(kDebugMode) print('CART: REMOVED PRODUCT at INDEX: $index');
}




// A method to save cart items in the Locals
void saveCartItemsToLocals() async {
  final sp = await SharedPreferences.getInstance();
  if(cartProductsList.isNotEmpty){
    String pureJson = CartHelperMethods.encode(cartProductsList);
    await sp.setString(FoodyLocals.CART, pureJson);
    if(kDebugMode) print("SAVED CART TO LOCALS ::: $pureJson");
  }
}



// Method: Retrieve cart items saved in the Locals
void retrieveCartItemsFromLocals() async {
  final sp = await SharedPreferences.getInstance();
  String? savedCartString = await sp.getString(FoodyLocals.CART);

  if(savedCartString != null){
    var returnedMap = CartHelperMethods.decode(savedCartString);
    cartProductsList.assignAll(returnedMap);
    if(kDebugMode) print("LIST of CART from LOCALS ::: $cartProductsList");
  }else {
    if(kDebugMode) print("LIST of CART from LOCALS ::: (0 items found)");
  }
}






 //////////// ORDER SECCTION  ////////////////////////////////
 
  Future<void> fetchAllOrderedProducts() async {
    // Getting the products
    Response response = await HelperAPIMethods.getDataWithHeader(FoodyAPI.BASE_URL + FoodyAPI.orderListsEndpoint);

    if(response.statusCode==200){
      // A helper list variable
      List<OrderModel> ordersList = [];
      ordersList.clear();

      // Looping through the response
      for(var order in response.body){
        // Adding each data to our helper list
        ordersList.add(OrderModel.fromJson(order));
      }

      // populating our ALL - ORDERS list
      allOrderedProductsList.assignAll(ordersList);
      if(kDebugMode) print('ALL ORDERS RESPONSE: $allOrderedProductsList');

      // Looping through allOrderedProductsList
      for(var order in allOrderedProductsList){
        // Looping through all itemsList inside OrderedList
        for(var item in order.items){
          // Looping through allProductsList
          for(var prod in allGroceryProductsList){
            // if orderedProduct ID equals productID in allProductsList. "item.product" gives the product ID
            if(item.product == prod.id){
              var orderRefurbishItem = OrderRefurbishedModel(
                orderID: order.id, 
                price: item.price, 
                quantity: item.quantity, 
                product: prod, 
                createdAt: order.created,
              );
              // adding the orderRefurbishItem to the allOrders list
              allOrdersList.add(orderRefurbishItem);
            }
          }
        }
      }

      if(kDebugMode) print("REFURBISH ORDERED ITEMS: $allOrdersList");

    }else {
      if(kDebugMode) print("FAILED TO FETCH ORDERS . . .");
    }
  }




  // This methods helps the user to make an order
  Future<void> makeAnOrder(CreateOrderModel createOrderModel) async {
    Get.back(); // closing bottom sheet

    // progress dialog
    showProgressDialog(message: "Creating your order . . .");

    Response response = await HelperAPIMethods.postData(
      uri: FoodyAPI.BASE_URL + FoodyAPI.orderProductsEndpoint,
      withHeader: true,
      body: createOrderModel.toJson()
    );

    if(kDebugMode)print("TEST STATUS CODE: ${response.statusCode}");
    if(kDebugMode)print("TEST STATUS TEXT: ${response.statusText}");

    if(response.statusCode==200){
      // saving details to locals
      await authController.saveUserDetailsInLocals(
        orderID: response.body["order_id"],
      );

      if(kDebugMode) print("CREATE ORDER RESPONSE: ${response.body}");

      Get.back();
      // Preview Data stored in the Locals
      await authController.showUserDetailsInLocals();
      // Go to payment screen
      Get.to(PaymentScreen(orderID: response.body["order_id"].toString()));

      // clear cart items upon order success
      cartProductsList.clear();
      await authController.clearCartDataUponOrder();
    } else{
      Get.back();
      authController.showSweetToast(message: "Order Failed. Please try again", isSuccess: false);
    }
  }

  
}