import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/user_model.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:logger/logger.dart';

import '../../data/remote/api_call_status.dart';
import '../../data/remote/firebase_auth.dart';

class LoginController extends GetxController {
  // hold data coming from api
  List<dynamic>? data;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  // Declaring Services
  AuthServices _authServices = AuthServices();

// Declaring UI State Variables
  bool isloding = false;

// Declaring Services Varibales

  User? user;
  UserModel? appUser;

  String? phoneValidation;

  void validatePhone(String val) {
    if (val.length == 10) {
      phoneValidation = null;
      update();
    } else {
      phoneValidation = "Enter Valid Phone Number";
      update();
    }
  }

  Future login() async {
    try {
      UserModel userModel = await _authServices.signin(
          phoneController.text, passwordController.text);
    } on Exception catch (e) {
      Logger().e(e);
    }
  }

  @override
  void onReady() async {
    super.onReady();
    // user == null ? Get.offNamed(Routes.Login) : Get.offNamed(Routes.BASE);
    user = _authServices.checkCurrentUser();
    if (user == null) {
      Get.offNamed(Routes.Login);
    } else {
      appUser = await _authServices.fetchUserData(user!.uid);
      Logger().i("User Alerady Logged in");

      Get.offNamed(Routes.BASE);
    }
  }
}
