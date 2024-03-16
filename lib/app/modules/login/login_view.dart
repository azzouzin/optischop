import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/config/theme/my_spaces.dart';

import '../../components/custom_textfield.dart';
import '../../data/remote/api_call_status.dart';
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
            child: SingleChildScrollView(
              child: SizedBox(
                height: 770.h,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpaceSmall,
                    Center(
                        child: SizedBox(
                            width: 250.w,
                            height: 250.w,
                            child: Image.asset("assets/images/loginbg.png"))),
                    verticalSpaceLarge,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: Column(
                        children: [
                          CustomTextField(
                            iconData: Icons.email,
                            obscureText: false,
                            controller: controller.phoneController,
                            hint: "05 62 41 39 35",
                            label: "Phone Number",
                            textInputType: TextInputType.phone,
                            phoneValidation: controller.phoneValidation,
                            onChanged: controller.validatePhone,
                          ),
                          verticalSpaceMedium,
                          CustomTextField(
                            obscureText: true,
                            iconData: Icons.lock_open,
                            controller: controller.passwordController,
                            hint: "**********",
                            label: "Password",
                            textInputType: TextInputType.text,
                            // phoneValidation: controller.phoneValidation,
                            // onChanged: controller.validatePhone,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    CustomButton(
                      text: "Login ",
                      onPressed: () {
                        controller.login();
                      },
                      hasShadow: false,
                      disabled:
                          controller.apiCallStatus == ApiCallStatus.loading,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
