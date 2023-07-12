import 'dart:convert';
import 'package:foody/locals/local_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperAPIMethods {

  // instance of getConnect
  static final GetConnect _getConnect = GetConnect(timeout: const Duration(seconds: 30), maxAuthRetries: 3);


  static Map<String, String> foodyHeaders(email, password){
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${base64.encode(utf8.encode("$email:$password"))}',
    };
  }

  

  // A function performing GET request to a server. It has no headers, it is just getting the products
  static Future<Response> getData(String uri) async {
    try {
      Response response = await _getConnect.get(uri); // 
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // This is a function specifically for getting info/details from the API. 
  //It has headers which is needed for authorization of each specific user
  static Future<Response> getDataWithHeader(String uri,) async {
    try {
      // pattern magic
      var (email, password) = await fetchAuthDataFromLocals();
      // header to be given when foodyHeaders is called
      Response response = await _getConnect.get(uri, headers: foodyHeaders(email, password));
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }    






  // A function performing POST request to a server
  static Future<Response> postData({required String uri, required dynamic body, required bool withHeader}) async {    
    try{
      if(withHeader){
        // pattern magic
        var (email, password) = await fetchAuthDataFromLocals();
        // header to be given when foodyHeaders is called
        Response response = await _getConnect.post(uri, body, headers: foodyHeaders(email, password));
        print(response.toString()); // for testing
        print(body.toString());// for testing
        return response;
      }else{
        Response response = await _getConnect.post(uri, body);
        print(response.toString()); // for testing
        print(body.toString());// for testing
        return response;
      }
      
    }catch (e){
      print(e.toString()); // for testing
      return Response(statusCode: 1, statusText: e.toString());
    }
  }


  static Future<(String, String)> fetchAuthDataFromLocals() async {
    final sharedPref = await SharedPreferences.getInstance();
    String? email = await sharedPref.getString(FoodyLocals.EMAIL);
    String? password= await sharedPref.getString(FoodyLocals.PASSWORD);
    if(email != null && password != null){
      return (email, password);
    }
    return ("", "");
  }



}