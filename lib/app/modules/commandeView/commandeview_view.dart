// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:getx_skeleton/app/data/models/command_model.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';

import '../../components/screen_title.dart';
import 'commandeview_controller.dart';

class CommandeView extends StatelessWidget {
  CommandeView({super.key});
  CommandeViewController commandeViewController =
      Get.put(CommandeViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: const ScreenTitle(
                      title: 'Commandes',
                      dividerEndIndent: 280,
                    ),
                  ),
                  20.verticalSpace,
                  ...commandeViewController.commandesList
                      .map((e) => Center(
                              child: CommandeCard(
                            commandModel: e,
                          )))
                      .toList()
                ],
              ),
            )));
  }
}

class CommandeCard extends StatelessWidget {
  CommandModel commandModel;
  HomeController homeController = Get.put(HomeController());
  CommandeCard({
    Key? key,
    required this.commandModel,
  }) : super(key: key);

  String getTitle() {
    String title = "";
    for (var element in commandModel.products) {
      title =
          "$title ${homeController.products.where((e) => element.id == e.id).isEmpty ? 'Empty' : homeController.products.where((e) => element.id == e.id).first.name!}";
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(5.0, 5.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
            // Optional: controls how much the shadow spreads
          ),
        ],
      ),
      width: Get.width * 0.9,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber.withOpacity(0.4),
                  ),
                  child: const Icon(
                    Icons.fire_truck_outlined,
                    color: const Color.fromARGB(255, 177, 133, 0),
                  )),
              20.horizontalSpace,
              Expanded(
                child: Text(
                  getTitle(),
                  softWrap: true,
                  style: Get.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              const Icon(Icons.menu_sharp),
            ],
          ),
          8.verticalSpace,
          ticketDetailsWidget(
            "Destination",
            commandModel.deliveryAddress ?? "",
            "Total",
            "${commandModel.prixTotal}" + " DA",
            "Date",
            commandModel.dateTime.toString().substring(0, 9),
            "Heur",
            commandModel.dateTime.toString().substring(11, 16),
          ),
          16.verticalSpace,
          Container(
            width: Get.width * 0.8,
            height: Get.height * 0.05,
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                commandModel.status,
                style: Get.textTheme.bodyLarge!.copyWith(
                  color: const Color.fromARGB(255, 177, 133, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ticketDetailsWidget(
    String firstTitle,
    String firstDesc,
    String secondTitle,
    String secondDesc,
    String thirdTitle,
    String thirdDesc,
    String fourthTitle,
    String fourthDesc,
  ) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              8.verticalSpace,
              Text(
                secondTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              8.verticalSpace,
              Text(
                thirdTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              8.verticalSpace,
              Text(
                fourthTitle,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
              8.verticalSpace,
              Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
              8.verticalSpace,
              Text(
                thirdDesc,
                style: const TextStyle(color: Colors.black),
              ),
              8.verticalSpace,
              Text(
                fourthDesc,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }
}
/*  ...commandeViewController.commandesList
                .map((e) => Text(e.status))
                .toList()*/
