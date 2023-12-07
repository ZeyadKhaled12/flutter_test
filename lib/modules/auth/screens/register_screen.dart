import 'package:flutter/material.dart';

import '../widget/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const route = '/registe_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RegisterBody());
  }
}
