import 'package:flutter/material.dart';

import '../../../core/assets_manager.dart';

class AuthAppLogoTextWidget extends StatelessWidget {
  const AuthAppLogoTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 1 / 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(ImgAssets.appLogo),
            width: 90,
          ),
          const Padding(padding: EdgeInsets.only(bottom: 26)),
          Text(text,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontsAssets.alexandriaFont))
        ],
      ),
    );
  }
}
