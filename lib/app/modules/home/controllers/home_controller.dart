import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/category_model.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  SplashController _splashController = Get.put(SplashController());
  List<ProductModel> products = [];
  late CategoryModel selctedCategory;
  @override
  void onInit() {
    getProducts();
    selctedCategory = _splashController.categories.first;
    super.onInit();
  }

  void getProducts() {
    products = DummyHelper.products;
  }

  void changeCategory(CategoryModel categoryModel) {
    selctedCategory = categoryModel;
    update();
  }
}
