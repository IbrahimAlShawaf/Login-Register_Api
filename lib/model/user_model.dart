// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:user_api/model/user.dart';

class UserModel {
  bool? status;
  String? message;
  User? object;
  int? code;

  UserModel({
    this.status,
    this.message,
    this.object,
    this.code,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
   if (json['object'] != null) {
      object = User.fromJson(json['object']);
    }
    if (json['code'] != null) {
      code = json['code'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['object'] = object;
    data['code'] = code;
    // if (object != null) {
    //   data['object'] = object!.toJson();
    // }
    return data;
  }
}
