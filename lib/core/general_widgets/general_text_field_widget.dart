import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../assets_manager.dart';

class GeneralTextFieldWidget extends StatefulWidget {
  const GeneralTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      this.isPassword = false});
  final String hintText;
  final TextEditingController textEditingController;
  final bool isPassword;

  @override
  State<GeneralTextFieldWidget> createState() => _GeneralTextFieldState();
}

class _GeneralTextFieldState extends State<GeneralTextFieldWidget> {
  bool isSeePassword = false;
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
      child: TextField(
        controller: widget.textEditingController,
        cursorColor: Colors.black,
        obscureText: widget.isPassword && !isSeePassword ? true : false,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: FontsAssets.alexandriaFont),
        decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isSeePassword = !isSeePassword;
                      });
                    },
                    icon: Icon(
                      isSeePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                      size: 25,
                    ))
                : null,
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: FontsAssets.alexandriaFont)),
      ),
    );
  }
}
