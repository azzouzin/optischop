import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/config/theme/dark_theme_colors.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';

import './login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Login IamPack",
                  style: Get.textTheme.titleLarge,
                ),
                // CustomTextField(controller: ),
                TextField(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.textInputType,
  });
  String label;
  String hint;
  TextEditingController controller;
  TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      style: TextStyle(fontSize: 15, color: DarkThemeColors.primaryColor),
      decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(fontSize: 13, color: DarkThemeColors.primaryColor),
          ),
          hintText: hint,
          hintStyle:
              TextStyle(fontSize: 13, color: DarkThemeColors.accentColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                  width: 1,
                  color: LightThemeColors.primaryColor.withOpacity(0.5))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:
                  BorderSide(width: 2, color: LightThemeColors.primaryColor))),
    );
  }
}
