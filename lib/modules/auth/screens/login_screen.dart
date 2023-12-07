import 'package:flutter/material.dart';

import '../widget/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const route = '/login_route';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
