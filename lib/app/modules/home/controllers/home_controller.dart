import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/category_model.dart';
import 'package:getx_skeleton/app/data/remote/firestore_db.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';
import 'package:getx_skeleton/utils/constants.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  SplashController _splashController = Get.put(SplashController());
  FireStorDB _fireStorDB = FireStorDB();
  List<ProductModel> products = [];
  late CategoryModel selctedCategory;
  bool isLoading = true;
  @override
  void onInit() {
    getProducts();
    selctedCategory = _splashController.categoriesList.first;
    super.onInit();
  }

  void getProducts() async {
    //products = DummyHelper.products;
    var productsData =
        await _fireStorDB.getListDocuments(Constants.productsCollection);
    for (var element in productsData) {
      var product = ProductModel.fromMap(element);
      product.category = _splashController.categoriesList
              .where((element) => element.id == product.category)
              .isEmpty
          ? "No Category"
          : _splashController.categoriesList
              .where((element) => element.id == product.category)
              .first
              .name;
      // print("${product.name} ${product.category}");
      // print(product.category);
      products.add(ProductModel.fromMap(element));
    }
    isLoading = false;
    update();
  }

  void changeCategory(CategoryModel categoryModel) {
    selctedCategory = categoryModel;
    update();
  }
}
