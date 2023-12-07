import 'package:flutter/material.dart';
import 'package:fluttertest/core/enums.dart';
import 'package:fluttertest/modules/home/controllers/home_controller.dart';
import 'package:fluttertest/modules/home/model/update_info_model.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';

import '../../../core/general_widgets/general_snack_bar.dart';
import '../widget/update_body_widget.dart';

class UpdateInformationScreen extends StatefulWidget {
  const UpdateInformationScreen({super.key});
  static const route = '/UpdateInformationScreen';

  @override
  State<UpdateInformationScreen> createState() =>
      _UpdateInformationScreenState();
}

class _UpdateInformationScreenState extends State<UpdateInformationScreen> {
  List<TextEditingController> controllers =
      List.generate(3, (index) => TextEditingController());
  final HomeController homeController = Get.find();
  Country? country;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HomeUpdateBodyWidget(
        textFieldsIsPassword: const [false, false, false],
        isLoading: homeController.requestState.value == RequestState.loading,
        textFieldsIsPhone: const [false, true, false],
        textEditingControllers: controllers,
        onCountryChanged: (country) {
          setState(() {
            this.country = country;
          });
        },
        textFieldsTexts: const ['Name', 'Phone', 'Email'],
        onPressed: () async {
          await homeController.updateInfo(UpdateInfoModel(
              token: homeController.userModel.value.token,
              countryCode: country == null ? '+971' : country!.dialCode,
              name: controllers[0].text,
              phone: controllers[1].text,
              email: controllers[2].text));
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
        title: 'Update Information',
      ),
    );
  }
}
