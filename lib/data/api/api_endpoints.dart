class FoodyAPI {

  // AUTH
  static const String BASE_URL = "https://web-production-db3e.up.railway.app";

  static const String loginEndpoint = "/auth/login/";  // POST

  static const String logoutEndpoint = "/auth/logout/"; // GET

  static const String registrationEndpoint = "/auth/registration/";  // POST

  static const String passwordResetEndpoint = "/auth/password/reset/";  // POST

  static const String passwordResetConfirmEndpoint = "/auth/password/reset/confirm/";  // POST

  static const String userDetailsEndpoint = "/auth/user/";  // GET
  static const String userUpdateDetailsEndpoint = "/auth/user/";  // PUT




  // CONTACT US
  static const String contactUsEndpoint = "/contact/";  // POST




  // DELIVERY DETAILS
  static const String deliveredProductsListEndpoint = "/delivery/";  // GET

  static String deliveryDetailOfProductEndpoint(String deliveryID){
    return "/delivery/$deliveryID/";  // GET
  }





  // FAVOURITES
  static const String favouriteListEndpoint = "/favourite/"; // GET

  static const String favouriteCreateEndpoint = "/favourite/create/"; // POST

  static String favouriteDetailEndpoint(String productSlug){
    return "/favourite/$productSlug/";
  } 




  // PRODUCT CATEGORY
  static const String categoryListEndpoint = "/category/";  // GET

  static String categoryDetailEndpoint(String categorySlug) {
    return "/category/$categorySlug/";  // GET
  }




  // NOTIFICATIONS
  static const String notificationListEndpoint = "/notification/";

  static const String notificationCreateEndpoint = "/notification/create/";

   static String notificationDetailEndpoint(String notificationID){
    return "/notification/$notificationID/";  // GET
  }





  // MAKING ORDERS
  static const String orderProductsEndpoint = "/order/create"; // POST

  static const String orderListsEndpoint = "/order/";   // GET

  static String orderDetailEndpoint(String orderID){
    return "/order/$orderID/";  // GET
  }




  // PRODUCTS
  static const String productsListEndpoint = "/products/";  // GET

  static String relatedProductsList(String productSlug) {
    return "/products/related-products/$productSlug/"; // GET
  }





  // PAYMENT
  static String paymentFormEndpoint(String orderID){
    return "/payment/form/$orderID"; // POST
  }

  static String validatePaymentEndpoint(String orderID, String flwRef){
    return "/payment/validate/$orderID/$flwRef"; // POST
  }

  static String verifyPaymentEndpoint(String orderID){
    return "/payment/verify/$orderID"; // GET
  }


  

}