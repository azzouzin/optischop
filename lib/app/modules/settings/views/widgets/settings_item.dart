import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants.dart';
class SettingsItem extends StatelessWidget {
  final String title;
  final String icon;
  final String phone;
  final bool isAccount;
  final bool isDark;
  Function()? onTap = () {};
  SettingsItem({
    Key? key,
    required this.title,
    required this.icon,
    this.isAccount = false,
    this.onTap,
    this.isDark = false,
    this.phone = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return InkWell(
      onTap: () {
        onTap == null ? null : onTap!();
      },
      child: ListTile(
        title: Text(title,
            style: theme.textTheme.displayMedium?.copyWith(
              fontSize: 16.sp,
            )),
        subtitle: !isAccount
            ? null
            : Text(
                phone,
                style: theme.textTheme.displaySmall,
              ),
        leading: CircleAvatar(
          radius: isAccount ? 30.r : 25.r,
          backgroundColor: theme.primaryColor,
          child: SvgPicture.asset(icon, fit: BoxFit.none),
        ),
        trailing: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SvgPicture.asset(Constants.forwardArrowIcon,
                    fit: BoxFit.none),
              ),
      ),
    );
  }
}
