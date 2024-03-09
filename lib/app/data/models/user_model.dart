// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:logger/logger.dart';

class UserModel {
  String id;
  String? username;
  String? email;
  String? birthdate;
  String? birthplace;
  String? phoneNumber;
  String? imageUrl;
  String? occupation;
  String? password;
  String state;
  String municipality;
  String? experienceYears;
  String? fcmToken;
  bool isProvider;
  bool isActivated;
  dynamic rating;
  dynamic? ratersNumber;

  UserModel({
    required this.username,
    required this.id,
    required this.email,
    this.birthdate,
    this.birthplace,
    required this.phoneNumber,
    this.occupation,
    required this.rating,
    this.password,
    required this.state,
    required this.municipality,
    required this.isProvider,
    required this.isActivated,
    required this.imageUrl,
    this.fcmToken,
    this.ratersNumber,
    this.experienceYears,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'birthdate': birthdate,
      'birthplace': birthplace,
      'phoneNumber': phoneNumber,
      'rating': rating,
      'occupation': occupation,
      //'password': password,
      'state': state,
      'imageUrl': imageUrl,
      'municipality': municipality,
      'experienceYears': experienceYears,
      'isProvider': isProvider,
      'fcmToken': fcmToken,
      'ratersNumber': ratersNumber,
      'isActivated': isActivated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    Logger().w(map);
    return UserModel(
      id: map['id'] as String,
      username: map['username'] as String?,
      imageUrl: map['imageUrl'] as String?,
      birthdate: map['birthdate'] as String?,
      isActivated: map['isActivated'] ?? false,
      rating: map['rating'] as dynamic,
      email: map['email'] as String?,
      birthplace: map['birthplace'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      occupation: map['occupation'] as String?,
      password: map['password'] != null ? map['password'] as String : null,
      state: map['state'] as String,
      municipality: map['municipality'] as String,
      experienceYears: map['experienceYears'] as String?,
      fcmToken: map['fcmToken'] as String?,
      isProvider: map["isProvider"] as bool,
      ratersNumber: map["ratersNumber"] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
