// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import 'package:image_encription_app/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:image_encription_app/app/modules/authentication/views/authentication_view.dart';
import 'package:image_encription_app/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:image_encription_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:image_encription_app/app/modules/home/bindings/home_binding.dart';
import 'package:image_encription_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
