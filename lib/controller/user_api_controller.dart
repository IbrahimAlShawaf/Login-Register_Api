import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_api/constant/api_constant.dart';
import 'package:user_api/model/user_model.dart';

class AuthController {
  final String BASE_URL = 'http://demo-api.mr-dev.tech/api/students/auth/';

// Api for register
  Future<UserModel> register({ email, password, full_name, gender}) async {
    Uri uri = Uri.parse("${BASE_URL}$registerUrl");
    http.post(uri);

    var body = {
      'email': email,
      'password': password,
      'full_name': full_name,
      'gender': gender,
    };

    http.Response response = await http.post(uri, body: body);
    return UserModel.fromJson(jsonDecode(response.body));
  }

// Api For Login
Future<UserModel>  login({ email, password}) async {
    Uri uri = Uri.parse("${BASE_URL}$loginUrl");
     http.post(uri);

    var body = {
      'email': email,
      'password': password,
    };

    
      http.Response response = await http.post(uri, body: body);
     return UserModel.fromJson(jsonDecode(response.body));
   
  }


  Future<UserModel> forgotPassword({required String email}) async {
    Uri uri = Uri.parse("${BASE_URL}$forgetPassword");
    var response = await http.post(uri, body: {'email': email});

    return UserModel.fromJson(jsonDecode(response.body));
  }

  Future<UserModel> resetPassword(
      {required String email,
        required String code,
        required String password}) async {
    Uri uri = Uri.parse("${BASE_URL}$forgetPassword");
    var response = await http.post(uri,body: {
      'email':email,
      'code':code,
      'password':password,
      'password_confirmation': password,
    });

    // if(response.statusCode == 200 || response.statusCode == 400) {
    //   var jsonResponse = jsonDecode(response.body);
    //   }
    return UserModel.fromJson(jsonDecode(response.body));
  }
}


