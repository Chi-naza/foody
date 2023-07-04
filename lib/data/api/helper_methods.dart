import 'dart:convert';

import 'package:foody/locals/local_data.dart';
import 'package:get/get.dart';

class HelperAPIMethods {

  // instance of getConnect
  static final GetConnect _getConnect = GetConnect(timeout: const Duration(seconds: 30), maxAuthRetries: 3);

  // Setting up authorization for basic auth
  static String basicAuth = 'Basic ${base64.encode(utf8.encode("${FoodyLocals.USER_NAME}:${FoodyLocals.PASSWORD}"))}';


  static Map<String, String> foodyHeaders =  {
    'Content-Type': 'application/json',
    'Authorization': basicAuth,
  };

  

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
  Future<Response> getDataWithHeader(String uri,) async {
    try {
      Response response = await _getConnect.get(uri, headers: foodyHeaders); // header to be given when getUserData is called
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }    






  // A function performing POST request to a server
  static Future<Response> postData(String uri, dynamic body, bool withHeader) async {    
    try{
      if(withHeader){
        Response response = await _getConnect.post(uri, body, headers: foodyHeaders);
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



}