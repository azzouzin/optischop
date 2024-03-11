import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/models/user_model.dart';
//import '../../../data/remote/auth_services.dart';
import '../../../data/remote/firebase_auth.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  AuthServices _authServices = AuthServices();
  User? user;
  UserModel? appUser;

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
