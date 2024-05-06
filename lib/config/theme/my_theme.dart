import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/local/shared_pref.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {
  static getThemeData({required bool isLight}) {
    return ThemeData(
      useMaterial3: true,
     
      primaryColor: LightThemeColors.primaryColor,
     
      colorScheme: ColorScheme.fromSwatch(
        accentColor: LightThemeColors.accentColor,
        backgroundColor: LightThemeColors.backgroundColor,
        brightness: Brightness.light,
      ).copyWith(secondary: LightThemeColors.accentColor),
    
      brightness: isLight ? Brightness.light : Brightness.dark,
   
      cardColor: LightThemeColors.cardColor,
      hintColor: LightThemeColors.hintTextColor,
     
      dividerTheme:
          const DividerThemeData(color: LightThemeColors.dividerColor),
    
      scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,


      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: LightThemeColors.primaryColor),


      appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),


      elevatedButtonTheme:
          MyStyles.getElevatedButtonTheme(isLightTheme: isLight),


      textTheme: MyStyles.getTextTheme(isLightTheme: isLight),


      chipTheme: MyStyles.getChipTheme(isLightTheme: isLight),

  
      iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),
    );
  }
}
