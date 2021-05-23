import 'package:family_pod/pages/home_page.dart';
import 'package:family_pod/pages/manage/add_member_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routeNames = {};
  static final routes = [
    GetPage(name: RouteNames.rootPage, page: () => HomePage()),
    GetPage(name: RouteNames.addMemberPage, page: () => AddMemberPage()),
  ];
}

class RouteNames {
  static final rootPage = "/";
  static final addMemberPage = "/members/add";
}
