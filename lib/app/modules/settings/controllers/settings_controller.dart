import 'package:get/get.dart';

import '../../../../config/theme/my_theme.dart';
import '../../../data/local/shared_pref.dart';

class SettingsController extends GetxController {
  // get is light theme from shared pref
  var isLightTheme = SharedPref.getThemeIsLight();

  /// change the system theme
  changeTheme(bool value) {
    MyTheme.changeTheme();
    isLightTheme = SharedPref.getThemeIsLight();
    update(['Theme']);
  }
}
