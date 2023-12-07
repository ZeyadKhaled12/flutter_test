import 'package:flutter/material.dart';

import '../../../core/assets_manager.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key, required this.iconData, required this.value});
  final IconData iconData;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 5, left: 15),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Theme.of(context).primaryColor,
            size: 25,
          ),
          const Padding(padding: EdgeInsets.only(right: 20)),
          Text(
            value,
            style: const TextStyle(
                fontFamily: FontsAssets.alexandriaFont,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
