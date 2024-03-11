import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
