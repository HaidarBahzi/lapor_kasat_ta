// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:lapor_kasat/app/pages/dashboard.dart';
import 'package:lapor_kasat/app/pages/form_pengaduan.dart';
// import 'package:lapor_kasat/app/pages/splash_screen.dart';

class Routes {
  static const SPLASH = '/';
}

final router = [GetPage(name: Routes.SPLASH, page: () => FormPengaduan())];
