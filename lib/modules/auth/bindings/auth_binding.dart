import 'package:fluttertest/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
