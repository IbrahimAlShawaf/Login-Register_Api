import 'dart:convert';

import 'package:http/http.dart';
import 'package:user_api/constant/api_constant.dart';


class AuthController {
  final String BASE_URL = 'http://demo-api.mr-dev.tech/api/students/auth/';


// Api for register
  void register (String email, password, full_name, gender) async {
    Uri uri = Uri.parse("${BASE_URL}$registerUrl");
    // http.post(uri);

    var body = {
      'email': email,
      'password': password,
       'full_name': full_name,
      'gender': gender,
    };

    try {
      Response response = await post(uri, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['object']['token']);
        print("Account Created successfully");
      } else {
        print("The email has already been taken.");
      }
    } catch (e) {
      print(e.toString());
    }
  }



// Api For Login

  void login (String email, password) async {
    Uri uri = Uri.parse("${BASE_URL}$loginUrl");
    // http.post(uri);

    var body = {
      'email': email,
      'password': password,
    };

    try {
      Response response = await post(uri, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['object']['token']);
        print("Login successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

