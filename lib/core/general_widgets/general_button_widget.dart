import 'package:flutter/material.dart';

import '../assets_manager.dart';

class GeneralButtonWidget extends StatelessWidget {
  const GeneralButtonWidget(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.textColor,
      required this.borderColor,
      required this.onPressed,
      this.isLoading = false});
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor)),
          )
        : Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 1 / 9,
                right: MediaQuery.of(context).size.width * 1 / 9),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1),
              color: buttonColor,
            ),
            child: TextButton(
                onPressed: onPressed,
                child: Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontsAssets.alexandriaFont),
                )),
          );
  }
}
