import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
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
      apiCallStatus = ApiCallStatus.loading;
      update();
      UserModel userModel = await _authServices.signin(
          phoneController.text, passwordController.text);
      appUser = userModel;
      apiCallStatus = ApiCallStatus.success;
      update();
      Get.toNamed(Routes.BASE);
      CustomSnackBar.showCustomSnackBar(
          title: "Welcome Back", message: "Welcome Back ${userModel.username}");
    } on Exception catch (e) {
      Logger().e(e);
      CustomSnackBar.showCustomErrorSnackBar(
        title: "Wrong Password Or Phone",
        message: "Verifie Your Password and Phone Number",
      );
      apiCallStatus = ApiCallStatus.success;
      update();
    }
  }

  void logout() {
    _authServices.signout().then((value) => Get.toNamed(Routes.Login));
  }

  void updateAppUserData(UserModel myappUser) {
    appUser = myappUser;
    print(appUser!.id);
    update();
  }
}
