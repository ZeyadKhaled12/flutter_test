import 'package:flutter/material.dart';

import '../../../core/assets_manager.dart';

class HomeCardButtonWidget extends StatelessWidget {
  const HomeCardButtonWidget(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          shadowColor: Colors.grey.withOpacity(0.29),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 5, left: 15, bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                    style: TextStyle(
                        fontFamily: FontsAssets.alexandriaFont,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                        fontSize: 19)),
                Icon(Icons.arrow_forward_ios_sharp,
                    color: Theme.of(context).primaryColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
