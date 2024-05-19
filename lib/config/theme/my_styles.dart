import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_fonts.dart';
import 'light_theme_colors.dart';

class MyStyles {

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
    labelLarge: MyFonts.buttonTextStyle.copyWith(
      fontSize: MyFonts.buttonTextSize,
    ),
    bodyLarge: (MyFonts.bodyTextStyle).copyWith(
      fontWeight: FontWeight.bold,
      fontSize: MyFonts.bodyLargeSize,
      color:  LightThemeColors.bodyTextColor
         ,
    ),
    bodyMedium: (MyFonts.bodyTextStyle).copyWith(
      fontSize: MyFonts.bodyMediumSize,
      color:  LightThemeColors.bodyTextColor
         ,
    ),
    displayLarge: (MyFonts.displayTextStyle).copyWith(
      fontSize: MyFonts.displayLargeSize,
      fontWeight: FontWeight.bold,
      color: LightThemeColors.displayTextColor
          ,
    ),
    bodySmall: TextStyle(
        color:  LightThemeColors.bodySmallTextColor
           ,
        fontSize: MyFonts.bodySmallTextSize),
    displayMedium: (MyFonts.displayTextStyle).copyWith(
        fontSize: MyFonts.displayMediumSize,
        fontWeight: FontWeight.bold,
        color: LightThemeColors.displayTextColor
           ),
    displaySmall: (MyFonts.displayTextStyle).copyWith(
      fontSize: MyFonts.displaySmallSize,
      fontWeight: FontWeight.bold,
      color:  LightThemeColors.displayTextColor
      ,
    ),
  );

  
}
