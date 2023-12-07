import 'package:flutter/material.dart';
import 'package:fluttertest/core/enums.dart';
import 'package:get/get.dart';

import '../../../core/general_widgets/general_button_widget.dart';
import '../../../core/general_widgets/general_snack_bar.dart';
import '../../../core/general_widgets/general_text_field_widget.dart';
import '../../home/view/home_screen.dart';
import '../controllers/auth_controller.dart';
import '../model/login_model.dart';
import '../screens/register_screen.dart';
import 'app_logo_text_widget.dart';
import 'bottom_navigate_widget.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final AuthController controller = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                const AuthAppLogoTextWidget(text: 'Login'),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 1 / 12.9)),
                GeneralTextFieldWidget(
                    hintText: 'Email Address',
                    textEditingController: emailController),
                GeneralTextFieldWidget(
                    hintText: 'Password',
                    isPassword: true,
                    textEditingController: passwordController),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Obx(() => GeneralButtonWidget(
                    text: 'Login',
                    isLoading:
                        controller.requestState.value == RequestState.loading,
                    buttonColor: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    borderColor: Theme.of(context).primaryColor,
                    onPressed: () async {
                      await controller.login(LoginModel(
                          email: emailController.text,
                          password: passwordController.text));
                      if (controller.requestState.value == RequestState.error) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(GSnackBar(
                                  isSucess: false,
                                  body: controller.errorMessage.value)
                              .get());
                        }
                      } else {
                        await Get.offNamed(HomeScreen.route,
                            arguments: controller.userModel.value);
                      }
                    })),
              ],
            ),
          ),
          AuthBottomNavigateWidget(
            text: 'Don\'t have account?',
            onTap: () async => await Get.offNamed(RegisterScreen.route),
            buttonNavigateText: 'Register',
          )
        ],
      ),
    );
  }
}
