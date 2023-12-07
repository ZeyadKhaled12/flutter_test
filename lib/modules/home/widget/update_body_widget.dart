import 'package:flutter/material.dart';
import 'package:fluttertest/core/general_widgets/general_phone_text_field_widget.dart';
import 'package:intl_phone_field/countries.dart';

import '../../../core/general_widgets/general_button_widget.dart';
import '../../../core/general_widgets/general_text_field_widget.dart';
import 'app_bar_widget.dart';

class HomeUpdateBodyWidget extends StatelessWidget {
  const HomeUpdateBodyWidget(
      {super.key,
      required this.textFieldsTexts,
      required this.textFieldsIsPassword,
      required this.textFieldsIsPhone,
      required this.title,
      required this.textEditingControllers,
      required this.onPressed,
      required this.isLoading,
      this.onCountryChanged});
  final String title;
  final List<String> textFieldsTexts;
  final List<bool> textFieldsIsPassword;
  final List<bool> textFieldsIsPhone;
  final List<TextEditingController> textEditingControllers;
  final Function() onPressed;
  final bool isLoading;
  final Function(Country country)? onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(
              context: context, title: title, isAutomaticallyImplyLeading: true)
          .getAppBar(),
      body: ListView(
        children: [
          const Padding(padding: EdgeInsets.only(top: 25)),
          Column(
            children: List.generate(
              textFieldsTexts.length,
              (index) => textFieldsIsPhone[index]
                  ? GPhoneTextFieldWidget(
                      hintText: textFieldsTexts[index],
                      controller: textEditingControllers[index],
                      onCountryChanged: onCountryChanged!)
                  : GeneralTextFieldWidget(
                      hintText: textFieldsTexts[index],
                      isPassword: textFieldsIsPassword[index],
                      textEditingController: textEditingControllers[index]),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
          GeneralButtonWidget(
              text: 'Save',
              isLoading: isLoading,
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              borderColor: Theme.of(context).primaryColor,
              onPressed: onPressed)
        ],
      ),
    );
  }
}
