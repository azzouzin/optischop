import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/firebase_options.dart';
import 'config/theme/my_theme.dart';
import 'app/routes/app_pages.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      rebuildFactor: (old, data) => true,
      useInheritedMediaQuery: true,
      builder: (context, widget) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          title: "Optischop",
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
           
            return Theme(
              data: MyTheme.getThemeData(isLight: true),
              child: MediaQuery(
                child: widget!,
                data: MediaQuery.of(context),
              ),
            );
          },
          initialRoute: AppPages.INITIAL,
        
         
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
