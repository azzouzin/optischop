import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:getx_skeleton/app/data/remote/firebase_auth.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';

import '../../../../config/theme/my_theme.dart';
class SettingsController extends GetxController {
  // get is light theme from shared pref

  SplashController splashController = Get.put(SplashController());
  AuthServices authServices = AuthServices();


  Future changeUserPassword(String newPassword, String oldPassword) async {
    try {
      await authServices.changePassword(newPassword, oldPassword).then((value) {
        Get.back();
        CustomSnackBar.showCustomSnackBar(
          title: "Done",
          message: "Password Changed",
        );
      });
    } on Exception catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: "Error",
        message: e.toString(),
      );
    }
  }
}
