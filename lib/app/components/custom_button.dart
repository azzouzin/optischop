import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color? backgroundColor;
  final double? radius;

  final void Function()? onPressed;

  final Widget? icon;
  final Color? borderColor;

  final double? width;

  const CustomButton({
    Key? key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.radius,
    this.borderColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      borderRadius: BorderRadius.circular(radius ?? 5.r),
      child: Container(
        padding: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 5.r),
          onTap: onPressed,
          child: Ink(
            width: width ?? double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 10.r),
              border: Border.all(color: borderColor ?? Colors.transparent),
              color: Get.theme.primaryColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Get.theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (icon != null)
                  SizedBox(
                    width: 10.w,
                  ),
                if (icon != null) icon!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
