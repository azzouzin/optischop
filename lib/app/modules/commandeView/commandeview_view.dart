import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/screen_title.dart';
import 'commandeview_controller.dart';

class CommandeView extends StatelessWidget {
  CommandeView({super.key});
  CommandeViewController commandeViewController =
      Get.put(CommandeViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: const ScreenTitle(
                    title: 'Payments',
                    dividerEndIndent: 280,
                  ),
                ),
                20.verticalSpace,
                ...commandeViewController.commandesList
                    .map((e) => Center(
                          child: Container(
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
                                  spreadRadius:
                                      2.0, // Optional: controls how much the shadow spreads
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
                                          color: const Color.fromARGB(
                                              255, 177, 133, 0),
                                        )),
                                    20.horizontalSpace,
                                    Expanded(
                                      child: Text(
                                        "Gobllet/Assiest",
                                        softWrap: true,
                                        style: Get.textTheme.bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.menu_sharp),
                                  ],
                                ),
                                8.verticalSpace,
                                ticketDetailsWidget(
                                  "Destination",
                                  "Sétif Ain Abbasa",
                                  "Total",
                                  "200.000.000 DZ",
                                  "Date",
                                  "12/12/2022",
                                  "Heur",
                                  "18:00",
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
                                      "NEW",
                                      style: Get.textTheme.bodyLarge!.copyWith(
                                        color: const Color.fromARGB(
                                            255, 177, 133, 0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList()
              ],
            )));
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
