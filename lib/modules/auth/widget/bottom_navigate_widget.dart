import 'package:flutter/material.dart';

import '../../../core/assets_manager.dart';

class AuthBottomNavigateWidget extends StatelessWidget {
  const AuthBottomNavigateWidget(
      {super.key,
      required this.text,
      required this.buttonNavigateText,
      required this.onTap});
  final String text;
  final String buttonNavigateText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontFamily: FontsAssets.alexandriaFont),
          ),
          const Padding(padding: EdgeInsets.only(right: 5)),
          InkWell(
            onTap: onTap,
            child: Text(
              buttonNavigateText,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontsAssets.alexandriaFont),
            ),
          ),
        ],
      ),
    );
  }
}
