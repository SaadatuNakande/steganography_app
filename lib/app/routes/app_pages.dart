import 'package:get/get.dart';

import 'package:image_encription_app/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:image_encription_app/app/modules/authentication/views/authentication_view.dart';
import 'package:image_encription_app/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:image_encription_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:image_encription_app/app/modules/decoderesult/bindings/decoderesult_binding.dart';
import 'package:image_encription_app/app/modules/decoderesult/views/decoderesult_view.dart';
import 'package:image_encription_app/app/modules/decription/bindings/decription_binding.dart';
import 'package:image_encription_app/app/modules/decription/views/decription_view.dart';
import 'package:image_encription_app/app/modules/encoderesult/bindings/encoderesult_binding.dart';
import 'package:image_encription_app/app/modules/encoderesult/views/encoderesult_view.dart';
import 'package:image_encription_app/app/modules/encription/bindings/encription_binding.dart';
import 'package:image_encription_app/app/modules/encription/views/encription_view.dart';
import 'package:image_encription_app/app/modules/home/bindings/home_binding.dart';
import 'package:image_encription_app/app/modules/home/views/home_view.dart';
import 'package:image_encription_app/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:image_encription_app/app/modules/welcome/views/welcome_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

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
    GetPage(
      name: _Paths.ENCRIPTION,
      page: () => EncriptionView(),
      binding: EncriptionBinding(),
    ),
    GetPage(
      name: _Paths.DECRIPTION,
      page: () => DecriptionView(),
      binding: DecriptionBinding(),
    ),
    GetPage(
      name: _Paths.ENCODERESULT,
      page: () => EncoderesultView(),
      binding: EncoderesultBinding(),
    ),
    GetPage(
      name: _Paths.DECODERESULT,
      page: () => DecoderesultView(),
      binding: DecoderesultBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}
