import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/category_card.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';
import '../../../components/product_item.dart';
import '../../../components/screen_title.dart';
import '../controllers/home_controller.dart';
import 'widgets/loader.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  SplashController splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GetBuilder<HomeController>(builder: (controller) {
          final myProducts = controller.selctedCategory.name == "All"
              ? controller.products
              : controller.products
                  .where((element) =>
                      element.category == controller.selctedCategory.name)
                  .toList();
          return controller.isLoading
              ? Loader()
              : ListView(
                  children: [
                    15.verticalSpace,
                    const ScreenTitle(title: 'Home'),
                    Text(
                      "Category",
                      style: context.theme.textTheme.displayMedium!,
                    ),
                    15.verticalSpace,
                    SizedBox(
                      height: 30.h,
                      width: Get.width,
                      child: GetBuilder<HomeController>(builder: (context) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            //itemCount: 10,
                            itemCount: splashController.categoriesList.length,
                            itemBuilder: (context, index) {
                              return CategoryItem(
                                  categoryModel:
                                      splashController.categoriesList[index]);
                            });
                      }),
                    ),
                    15.verticalSpace,
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.h,
                        mainAxisExtent: 300.h,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: myProducts.length,
                      itemBuilder: (context, index) {
                        // return (controller.selctedCategory.id ==
                        //    controller.products[index].category ||
                        //         controller.selctedCategory.name == "All")
                        //     ?
                        return ProductItem(
                          product: myProducts[index],
                        );
                        // : Container(
                        //     height: 50,
                        //     width: 50,
                        //     color: Colors.black,
                        //   );
                      },
                    ),
                    10.verticalSpace,
                  ],
                );
        }),
      ),
    );
  }
}
