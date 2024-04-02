import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:getx_skeleton/config/translations/localization_service.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';

import '../../../../utils/constants.dart';
import '../../../components/screen_title.dart';
import '../controllers/settings_controller.dart';
import 'widgets/settings_item.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);
  final LoginController loginController = Get.find();

  TextEditingController oldPassword1 = TextEditingController();
  TextEditingController newPassword1 = TextEditingController();
  TextEditingController newPassword2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            15.verticalSpace,
            ScreenTitle(
              title: Strings.settings.tr,
              dividerEndIndent: 230,
            ),
            20.verticalSpace,
            Text(
              Strings.account.tr,
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
            Text(Strings.settings.tr,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            20.verticalSpace,
            SettingsItem(
              title: Strings.darkmode.tr,
              icon: Constants.themeIcon,
              isDark: true,
            ),
            25.verticalSpace,
            SettingsItem(
                title: Strings.changeLanguage.tr,
                icon: Constants.languageIcon,
                onTap: () {
                  LocalizationService.updateLanguage(
                      Get.locale!.languageCode == "en" ? "ar" : "en");
                }),
            25.verticalSpace,
            SettingsItem(
                title: Strings.changePassword.tr,
                icon: Constants.settingsIcon,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content:

                              // height: ,

                              Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              25.verticalSpace,
                              myTextField(oldPassword1, Strings.oldPassword.tr),
                              25.verticalSpace,
                              myTextField(newPassword1, Strings.newPassword.tr),
                              25.verticalSpace,
                              myTextField(
                                  newPassword2, Strings.confirmPassword.tr),
                              25.verticalSpace,
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(Get.width * 0.8, Get.height * 0.075),
                                ),
                                onPressed: () async {
                                  if (newPassword1.text == newPassword2.text) {
                                    await controller.changeUserPassword(
                                        newPassword1.text, oldPassword1.text);
                                  } else {
                                    CustomSnackBar.showCustomErrorSnackBar(
                                        title: "Password Dosent Match",
                                        message: "Password Dosent Match");
                                  }
                                },
                                child: Text(
                                  Strings.submit.tr,
                                  style:
                                      theme.textTheme.displayMedium?.copyWith(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              25.verticalSpace,
                            ],
                          ),
                        );
                      });
                  /* controller.changeUserPassword(
                      newPassword1.text, oldPassword1.text);*/
                }),
            25.verticalSpace,
            SettingsItem(
              title: Strings.contactus.tr,
              icon: Constants.helpIcon,
            ),
            25.verticalSpace,
            SettingsItem(
              title: Strings.logout.tr,
              icon: Constants.logoutIcon,
              onTap: loginController.logout,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  SizedBox myTextField(TextEditingController editingController, String hint) {
    return SizedBox(
      width: 280.w,
      height: 50.h,
      child: TextField(
        controller: editingController,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Get.theme.primaryColor),
              borderRadius: BorderRadius.circular(8.r)),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 0.5, color: LightThemeColors.accentColor),
          ),
        ),
      ),
    );
  }
}
