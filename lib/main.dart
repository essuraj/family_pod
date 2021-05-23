import 'package:family_pod/core/theme.dart';
import 'package:family_pod/models/db/db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants.dart';
import 'core/routes.dart';
import 'pages/shared/page_404.dart';

late DB db;

void main() async {
  db = DB();

  runApp(GetMaterialApp(
    enableLog: true,
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.native,
    opaqueRoute: Get.isOpaqueRouteDefault,
    popGesture: Get.isPopGestureEnable,
    title: AppConstants.SITE_NAME,
    theme: AppThemes.lightTheme,
    darkTheme: AppThemes.lightTheme,
    unknownRoute: GetPage(name: '/not-found', page: () => Page404()),
    initialRoute: '/',
    getPages: AppRoutes.routes,
  ));
}
