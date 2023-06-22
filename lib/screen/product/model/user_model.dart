import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

UsersModel userModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.photoUrl,
  });
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? photoUrl;

  UsersModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        name = json["name"],
        email = json["email"],
        phoneNumber = json["phoneNumber"],
        photoUrl = json["photoUrl"];

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "photoUrl": photoUrl,
      };
}
