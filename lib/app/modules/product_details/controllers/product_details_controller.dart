import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';
import '../../cart/controllers/cart_controller.dart';

class ProductDetailsController extends GetxController {
  // for the product size
  var selectedSize = 'M';

  TextEditingController qtyController = TextEditingController();

  /// when the user press on add to cart button
  onAddToCartPressed(ProductModel product) {
    var mProduct = DummyHelper.products.firstWhere((p) => p.id == product.id);
    mProduct.quantity = mProduct.quantity! + 1;
    Get.find<CartController>().getCartProducts();
    Get.back();
  }

  /// change the selected size
  changeQty(int addedQte) {
    qtyController.text = addedQte == -1 && qtyController.text == "0"
        ? "0"
        : (int.parse(qtyController.text.isEmpty ? "0" : qtyController.text) +
                addedQte)
            .toString();
    update();
  }
}
