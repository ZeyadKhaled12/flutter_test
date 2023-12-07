import 'package:flutter/material.dart';
import 'package:fluttertest/core/enums.dart';
import 'package:fluttertest/modules/auth/model/register_model.dart';
import 'package:get/get.dart';

import '../../../core/general_widgets/general_button_widget.dart';
import '../../../core/general_widgets/general_snack_bar.dart';
import '../../../core/general_widgets/general_text_field_widget.dart';
import '../../home/view/home_screen.dart';
import '../controllers/auth_controller.dart';
import '../screens/login_screen.dart';
import 'app_logo_text_widget.dart';
import 'bottom_navigate_widget.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final AuthController controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const AuthAppLogoTextWidget(text: 'Register'),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 1 / 12.9)),
                GeneralTextFieldWidget(
                    hintText: 'Full Name',
                    textEditingController: nameController),
                GeneralTextFieldWidget(
                    hintText: '55994435',
                    isPhoneNumber: true,
                    textEditingController: phoneNumberController),
                GeneralTextFieldWidget(
                    hintText: 'Email Address',
                    textEditingController: emailController),
                GeneralTextFieldWidget(
                    hintText: 'Password',
                    isPassword: true,
                    textEditingController: passwordController),
                GeneralTextFieldWidget(
                    hintText: 'Confirm Password',
                    isPassword: true,
                    textEditingController: confirmPasswordController),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Obx(() => GeneralButtonWidget(
                    text: 'Register',
                    isLoading:
                        controller.requestState.value == RequestState.loading,
                    buttonColor: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    borderColor: Theme.of(context).primaryColor,
                    onPressed: () async {
                      await controller.register(RegisterModel(
                          countryCode: '+971',
                          name: nameController.text,
                          passwordConfirm: confirmPasswordController.text,
                          phone: phoneNumberController.text,
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
                    }))
              ],
            ),
            AuthBottomNavigateWidget(
              text: 'Already have an account?',
              onTap: () async => await Get.offNamed(LoginScreen.route),
              buttonNavigateText: 'Login',
            )
          ],
        ),
      ),
    );
  }
}
