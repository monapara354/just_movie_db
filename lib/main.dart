import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/injection/injection_container.dart';
import 'package:just_movie/routes/app_pages.dart';
import 'package:just_movie/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder:(context, orientation, deviceType)  {
        return GetMaterialApp(
          title: StringConstants.strAppName,
          // theme: ,
          getPages: AppPages.pageList,
          initialRoute: AppRoutes.initialRoute,
        );
      }
    );
  }
}
