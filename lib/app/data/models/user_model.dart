// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:logger/logger.dart';

class UserModel {
  String id;
  String? username;
  String? phoneNumber;
  String? imageUrl;
  String? password;
  String? state;
  String? municipality;
  String uid;
  String? fcmToken;

  UserModel({
    required this.username,
    required this.id,
    required this.phoneNumber,
    this.password,
    required this.state,
    required this.municipality,
    required this.uid,
    required this.imageUrl,
    this.fcmToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': username,
      'phone': phoneNumber,
      //'password': password,
      'address': state,
      'imageUrl': imageUrl,
      'state': municipality,
      'fcmToken': fcmToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    Logger().w(map);
    return UserModel(
      id: map['id'] as String,
      username: map['fullName'] as String?,
      imageUrl: map['imageUrl'] as String?,
      phoneNumber: map['phone'] as String?,
      password: map['password'] != null ? map['password'] as String : null,
      state: map['address'] as String,
      municipality: map['municipality'] as String?,
      fcmToken: map['fcmToken'] as String?,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
