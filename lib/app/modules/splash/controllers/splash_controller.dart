import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/category_model.dart';
import 'package:getx_skeleton/app/data/remote/firestore_db.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';
import 'package:getx_skeleton/utils/constants.dart';
import 'package:logger/logger.dart';

import '../../../data/models/user_model.dart';
//import '../../../data/remote/auth_services.dart';
import '../../../data/remote/firebase_auth.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final AuthServices _authServices = AuthServices();
  final FireStorDB _fireStorDB = FireStorDB();
  User? user;
  List<CategoryModel> categoriesList = [CategoryModel(id: "0", name: "All")];
  List<CategoryModel> unitsList = [CategoryModel(id: "0", name: "All")];
  List<CategoryModel> typesList = [CategoryModel(id: "0", name: "All")];
  LoginController loginController = Get.put(LoginController(), permanent: true);

  @override
  void onReady() async {
    super.onReady();
    // user == null ? Get.offNamed(Routes.Login) : Get.offNamed(Routes.BASE);
    user = _authServices.checkCurrentUser();
    if (user == null) {
      Get.offNamed(Routes.Login);
    } else {
      UserModel appUser = await _authServices.fetchUserData(user!.uid);
      Logger().i("User Alerady Logged in");
      Logger().i(appUser.id);
      loginController.updateAppUserData(appUser);
      Get.offNamed(Routes.BASE);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getParameters();
  }

  void getParameters() async {
    var categoryData =
        await _fireStorDB.getListDocuments(Constants.categoryCollection);
    var unitData =
        await _fireStorDB.getListDocuments(Constants.unitsCollection);
    var typeData =
        await _fireStorDB.getListDocuments(Constants.typesCollection);
    for (var element in categoryData) {
      categoriesList.add(CategoryModel.fromMap(element));
    }
    for (var element in unitData) {
      unitsList.add(CategoryModel.fromMap(element));
    }
    for (var element in typeData) {
      typesList.add(CategoryModel.fromMap(element));
    }
    print(typesList.length);
    print(categoriesList.length);
    print(unitsList.length);
  }
}
