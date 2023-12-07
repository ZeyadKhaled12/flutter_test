import 'package:flutter/material.dart';
import 'package:fluttertest/core/routes.dart';
import 'package:fluttertest/modules/auth/screens/splash_screen.dart';

import 'package:get/get.dart';
import 'app_theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      initialRoute: SplashScreen.route,
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
