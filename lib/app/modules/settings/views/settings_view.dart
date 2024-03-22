import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';

import '../../../../utils/constants.dart';
import '../../../components/screen_title.dart';
import '../controllers/settings_controller.dart';
import 'widgets/settings_item.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            15.verticalSpace,
            const ScreenTitle(
              title: 'Settings',
              dividerEndIndent: 230,
            ),
            20.verticalSpace,
            Text(
              'Account',
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            20.verticalSpace,
            SettingsItem(
              title: loginController.appUser!.username!,
              icon: Constants.userIcon,
              isAccount: true,
              phone: loginController.appUser!.phoneNumber!,
            ),
            30.verticalSpace,
            Text('Settings',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            20.verticalSpace,
            SettingsItem(
              title: 'Dark Mode',
              icon: Constants.themeIcon,
              isDark: true,
            ),
            25.verticalSpace,
            SettingsItem(
              title: 'Language',
              icon: Constants.languageIcon,
            ),
            25.verticalSpace,
            SettingsItem(
              title: 'Help',
              icon: Constants.helpIcon,
            ),
            25.verticalSpace,
            SettingsItem(
              title: 'Sign Out',
              icon: Constants.logoutIcon,
              onTap: loginController.logout,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
