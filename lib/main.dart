import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lapor_kasat/app/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        initialRoute: Routes.SPLASH,
        getPages: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
