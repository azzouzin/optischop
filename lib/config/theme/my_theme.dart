import 'package:flutter/material.dart';
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
     
   
      scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,



      textTheme: MyStyles.getTextTheme(isLightTheme: isLight),


    );
  }
}
