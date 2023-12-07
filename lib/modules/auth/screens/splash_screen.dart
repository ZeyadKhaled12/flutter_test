import 'package:flutter/material.dart';
import 'package:fluttertest/core/assets_manager.dart';
import 'package:fluttertest/core/general_widgets/general_animation_opacity_widget.dart';
import 'package:fluttertest/modules/auth/controllers/auth_controller.dart';
import 'package:fluttertest/modules/auth/screens/welcome_screen.dart';
import 'package:fluttertest/modules/home/view/home_screen.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const route = '/SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GAnimationOpacityWidget(
            widgetOpacity:
                const Image(image: AssetImage(ImgAssets.appLogo), height: 90),
            seconds: 2,
            onEnd: () {
              Future.delayed(const Duration(seconds: 2), () async {
                if (await authController.checkIfLogin()) {
                  UserModel userModel = await authController.getUser();
                  await Get.offNamed(HomeScreen.route, arguments: userModel);
                } else {
                  Get.offNamed(WelcomeScreen.route);
                }
              });
            }),
      ),
    );
  }
}
