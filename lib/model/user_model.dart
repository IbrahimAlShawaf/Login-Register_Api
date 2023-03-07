import 'package:user_api/model/user.dart';

class UserModel {
  bool? status;
  String? message;
  User? object;

  UserModel({this.status, this.message, this.object});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ;
    message = json['message'];
    object = json['object'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['object'] = object;
    return data;
  }
}