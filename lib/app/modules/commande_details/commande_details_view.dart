import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/product_model.dart';
import 'package:getx_skeleton/app/modules/commande_details/widgets/command_product_item.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';

import '../../../utils/constants.dart';
import '../../components/screen_title.dart';
import '../../data/models/command_model.dart';

class CommandeDetailsView extends StatelessWidget {
  CommandeDetailsView({super.key});
  CommandModel commandeModel = Get.arguments["commande"];
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double total = 0;
    commandeModel.products!.forEach((element) {
      total = total + element.price;
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              15.verticalSpace,
              const ScreenTitle(
                title: 'Details',
                dividerEndIndent: 280,
              ),
              15.verticalSpace,
              ListView.builder(
                itemCount: commandeModel.products.length,
                itemBuilder: (context, index) {
                  ProductModel productModel = homeController.products
                      .where((element) =>
                          element.id == commandeModel.products[index].id)
                      .first;
                  return ProductCommandeItem(
                    product: productModel,
                  ).animate().fade().slideX(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        begin: -1,
                        curve: Curves.easeInSine,
                      );
                },
                shrinkWrap: true,
                primary: false,
              ),
              15.verticalSpace,
              Row(
                children: [
                  Container(
                    width: 65.w,
                    height: 65.h,
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Constants.busIcon),
                        5.verticalSpace,
                        Text(
                          'FREE',
                          style: Get.theme.textTheme.displaySmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total:',
                          style: Get.theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 18.sp,
                          )),
                      10.verticalSpace,
                      Text(
                        'DZD ${total.toStringAsFixed(2)}',
                        style: Get.theme.textTheme.displayLarge?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Get.theme.primaryColor.withOpacity(0.5),
                          decorationThickness: 1,
                          color: Colors.transparent,
                          shadows: [
                            Shadow(
                                color: Get.theme.textTheme.displayLarge!.color!,
                                offset: const Offset(0, -5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ).animate().fade().slideX(
                    duration: const Duration(milliseconds: 300),
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
