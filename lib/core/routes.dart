import 'package:fluttertest/modules/auth/screens/splash_screen.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/screens/login_screen.dart';
import '../modules/auth/screens/register_screen.dart';
import '../modules/auth/screens/welcome_screen.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/view/home_screen.dart';
import '../modules/home/view/update_information_screen.dart';
import '../modules/home/view/update_password_screen.dart';

final routes = [
  GetPage(
    name: SplashScreen.route,
    binding: AuthBindings(),
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: WelcomeScreen.route,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: RegisterScreen.route,
    binding: AuthBindings(),
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name: LoginScreen.route,
    binding: AuthBindings(),
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: HomeScreen.route,
    binding: HomeBinding(),
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: UpdatePasswordScreen.route,
    binding: HomeBinding(),
    page: () => const UpdatePasswordScreen(),
  ),
  GetPage(
    name: UpdateInformationScreen.route,
    binding: HomeBinding(),
    page: () => const UpdateInformationScreen(),
  ),
];
