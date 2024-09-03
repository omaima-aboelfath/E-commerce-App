// https://ecommerce.routemisr.com/api/v1/auth/signup
// (protocol type) // (name of server) (/name of api)
// its type => post (send)
/* 
  more info=> in Google : fetch data from the internet
  1- Add the http package.
  2- Make a network request using the http package.
  3- Convert the response into a custom Dart object.
  4- Fetch and display the data with Flutter.
   */
import 'dart:convert';
import 'package:ecommerce_app/data/end_points.dart';
import 'package:ecommerce_app/data/model/request/LoginRequest.dart';
import 'package:ecommerce_app/data/model/request/RegisterRequest.dart';
import 'package:ecommerce_app/data/model/response/LoginResponse.dart';
import 'package:ecommerce_app/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';

  static Future<RegisterResponse> register(String email, String name,
      String phone, String password, String rePassword) async {
    // authority: name of server (vurl)
    // unencodedPath: name of Api that you will call
    Uri url = Uri.https(baseUrl, EndPoints.signUp);
    var registerRequest = RegisterRequest(
        name: name,
        email: email,
        password: password,
        phone: phone,
        rePassword: rePassword);
    // put it in try&catch if there was error related to connection
    try {
      var response = await http.post(url, body: registerRequest.toJson()
          // create jsonToDart class with this body or send it here directly
          // body: {
          //   "name": "Ahmed Abd Al-Muti",
          //   "email": "ahmedmuti2003@gmail.com",
          //   "password": "Ahmed@123",
          //   "rePassword": "Ahmed@123",
          //   "phone": "01010700701"
          // }
          );
      // if(response.statusCode == 200){ }
      // var bodyString = response.body; // String
      // var json = jsonDecode(bodyString); // convert string to json
      // return RegisterResponse.fromJson(json); // convert json to object
      ///// OR /////
      return RegisterResponse.fromJson(jsonDecode(response.body)); /////
    } catch (e) {
      throw e; // error from client (as internet connection)
    }
  }

  static Future<LoginResponse> login(String email, String password) async {
    Uri url = Uri.https(baseUrl, EndPoints.login);
    LoginRequest loginRequest = LoginRequest(email: email, password: password);
    try {
      var response = await http.post(url,
          body: loginRequest.toJson()); // understand map only
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return LoginResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
