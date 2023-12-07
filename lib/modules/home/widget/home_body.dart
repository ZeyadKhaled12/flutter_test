import 'package:flutter/material.dart';
import 'package:fluttertest/modules/auth/screens/login_screen.dart';
import 'package:fluttertest/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../../../core/enums.dart';
import '../../../core/general_widgets/general_snack_bar.dart';
import '../view/update_information_screen.dart';
import '../view/update_password_screen.dart';
import 'card_button_widget.dart';
import 'delete_ccount_laert_widget.dart';
import 'list_tile_widget.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.argument});
  final dynamic argument;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    homeController.onChanged(Get.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Obx(
        () => Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            ListTileWidget(
              iconData: Icons.person_outline,
              value: homeController.userModel.value.name,
            ),
            ListTileWidget(
              iconData: Icons.phone_android_outlined,
              value:
                  '${homeController.userModel.value.countryCode} ${homeController.userModel.value.phone}',
            ),
            ListTileWidget(
              iconData: Icons.email_outlined,
              value: homeController.userModel.value.email,
            ),
            HomeCardButtonWidget(
                text: 'Update Information',
                onPressed: () async {
                  await Get.toNamed(UpdateInformationScreen.route);
                }),
            HomeCardButtonWidget(
                text: 'Change Password',
                onPressed: () async {
                  await Get.toNamed(UpdatePasswordScreen.route);
                }),
            HomeCardButtonWidget(
                text: 'Delete Account',
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) => DeleteAccountWidget(
                            isLoading: homeController.requestState.value ==
                                RequestState.loading,
                            onTap: () async {
                              await homeController.deleteUser(
                                  homeController.userModel.value.token);
                              if (homeController.requestState.value ==
                                  RequestState.error) {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      GSnackBar(
                                              isSucess: false,
                                              body: homeController
                                                  .errorMessage.value)
                                          .get());
                                }
                              } else {
                                await Get.offNamed(LoginScreen.route);
                              }
                            },
                          ));
                }),
            HomeCardButtonWidget(
              text: 'Logout',
              onPressed: () async {
                await homeController.logOut();
                await Get.offNamed(LoginScreen.route);
              },
            )
          ],
        ),
      ),
    );
  }
}
