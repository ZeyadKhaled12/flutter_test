import 'package:flutter/material.dart';
import 'package:fluttertest/modules/home/widget/home_body.dart';
import 'package:get/get.dart';

import '../widget/app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const route = '/home_Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(
              context: context,
              isAutomaticallyImplyLeading: false,
              title: 'Home Page')
          .getAppBar(),
      body: HomeBody(argument: Get.arguments),
    );
  }
}
