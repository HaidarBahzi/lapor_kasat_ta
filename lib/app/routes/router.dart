// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:lapor_kasat/app/pages/favourite_page.dart';
import 'package:lapor_kasat/app/pages/splash_screen.dart';
import 'package:lapor_kasat/app/pages/dashboard.dart';

class Routes {
  static const SPLASH = '/';
  static const DASHBOARD = '/home';
}

final router = [GetPage(name: Routes.SPLASH, page: () => SplashScreen())];
final router = [GetPage(name: Routes.DASHBOARD, page: () => Dashboard())];
