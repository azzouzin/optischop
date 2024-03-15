import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_skeleton/app/modules/notifications/views/widgets/ticket_data.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:get/get.dart';

import '../../../components/screen_title.dart';
import '../controllers/notifications_controller.dart';
import 'widgets/notification_item.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            const ScreenTitle(
              title: 'Notifications',
              dividerEndIndent: 150,
            ),
            10.verticalSpace,

            /*  ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const NotificationItem()
                .animate().fade().slideY(
                  duration: const Duration(milliseconds: 300),
                  begin: 1,
                  curve: Curves.easeInSine,
                ),
              shrinkWrap: true,
              primary: false,
            ),*/
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 16.0.w),
                child: TicketWidget(
                        width: 350,
                        height: 250.h,
                        isCornerRounded: true,
                        color: Color.fromRGBO(223, 251, 222, 1),
                        //color: Get.theme.cardColor,
                        padding: const EdgeInsets.all(20),
                        child: const TicketData())
                    .animate()
                    .fade()
                    .slideY(
                      duration: const Duration(milliseconds: 300),
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
              ),
              shrinkWrap: true,
              primary: false,
            ),
          ],
        ),
      ),
    );
  }
}
