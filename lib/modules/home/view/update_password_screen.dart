import 'package:flutter/material.dart';
import 'package:fluttertest/modules/home/model/update_password_model.dart';
import 'package:get/get.dart';

import '../../../core/enums.dart';
import '../../../core/general_widgets/general_snack_bar.dart';
import '../controllers/home_controller.dart';
import '../widget/update_body_widget.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});
  static const route = '/UpdatePasswordScreen';

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  List<TextEditingController> controllers =
      List.generate(3, (index) => TextEditingController());
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HomeUpdateBodyWidget(
        textFieldsIsPassword: const [true, true, true],
        textFieldsIsPhone: const [false, false, false],
        textEditingControllers: controllers,
        isLoading: homeController.requestState.value == RequestState.loading,
        onPressed: () async {
          await homeController.updatePassword(UpdatePasswordModel(
              token: homeController.userModel.value.token,
              currentPassword: controllers[0].text,
              newPassword: controllers[1].text,
              passwordConfirm: controllers[2].text));
          if (homeController.requestState.value == RequestState.error) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(GSnackBar(
                      isSucess: false, body: homeController.errorMessage.value)
                  .get());
            }
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(GSnackBar(
                      isSucess: true,
                      body: 'Your information is updated successfully')
                  .get());
              Get.back();
            }
          }
        },
        textFieldsTexts: const [
          'Current Password',
          'New Password',
          'Confirm Password'
        ],
        title: 'Change Password',
      ),
    );
  }
}
