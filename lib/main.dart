import 'package:family_pod/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants.dart';
import 'pages/home_page.dart';
import 'pages/shared/page_404.dart';

void main() async {
  // await GetStorage.init();

  runApp(GetMaterialApp(
    enableLog: true,
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.native,
    opaqueRoute: Get.isOpaqueRouteDefault,
    popGesture: Get.isPopGestureEnable,
    title: AppConstants.SITE_NAME,
    theme: AppThemes.lightTheme,
    darkTheme: AppThemes.darkTheme,
    unknownRoute: GetPage(name: '/not-found', page: () => Page404()),
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => HomePage(title: 'Flutter Demo Home Page')),
    ],
  ));
}
