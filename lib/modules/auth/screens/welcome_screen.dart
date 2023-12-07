import 'package:flutter/material.dart';
import 'package:fluttertest/modules/auth/screens/register_screen.dart';
import 'package:get/get.dart';
import '../../../core/general_widgets/general_button_widget.dart';
import '../widget/app_logo_text_widget.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const route = '/welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AuthAppLogoTextWidget(text: 'Welcome to the app'),
        Column(
          children: [
            GeneralButtonWidget(
                text: 'Login',
                buttonColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                borderColor: Theme.of(context).primaryColor,
                onPressed: () async {
                  await Get.offNamed(LoginScreen.route);
                }),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            GeneralButtonWidget(
                text: 'Register',
                buttonColor: Colors.white,
                textColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                onPressed: () async {
                  await Get.offNamed(RegisterScreen.route);
                })
          ],
        ),
        const SizedBox()
      ],
    ));
  }
}
