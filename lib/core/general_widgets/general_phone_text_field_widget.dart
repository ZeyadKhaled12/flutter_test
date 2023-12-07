import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../assets_manager.dart';

class GPhoneTextFieldWidget extends StatelessWidget {
  const GPhoneTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onCountryChanged});
  final String hintText;
  final TextEditingController controller;
  final Function(Country country) onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: 20,
          left: MediaQuery.of(context).size.width * 1 / 9,
          right: MediaQuery.of(context).size.width * 1 / 9),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withOpacity(0.29), width: 1.5),
      ),
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: IntlPhoneField(
        showDropdownIcon: false,
        controller: controller,
        cursorColor: const Color.fromRGBO(0, 0, 0, 1),
        onCountryChanged: onCountryChanged,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: FontsAssets.alexandriaFont),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            counterText: '',
            hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: FontsAssets.alexandriaFont)),
        initialCountryCode: 'AE',
      ),
    );
  }
}
