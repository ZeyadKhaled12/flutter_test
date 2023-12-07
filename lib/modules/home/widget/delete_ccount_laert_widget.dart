import 'package:flutter/material.dart';
import 'package:fluttertest/core/assets_manager.dart';
import 'package:get/get.dart';

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget(
      {super.key, required this.onTap, required this.isLoading});
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor)),
          if (!isLoading)
            TextButton(
                onPressed: onTap,
                child: const Text('Yes',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontsAssets.alexandriaFont))),
          if (!isLoading) const Padding(padding: EdgeInsets.only(right: 20)),
          if (!isLoading)
            TextButton(
                onPressed: () async {
                  Get.back();
                },
                child: const Text('No',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: FontsAssets.alexandriaFont)))
        ],
      ),
      title: Text('Are you sure you want delete the account?',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: FontsAssets.alexandriaFont)),
    );
  }
}
