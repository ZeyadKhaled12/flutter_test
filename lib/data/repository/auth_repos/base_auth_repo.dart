import 'package:either_dart/either.dart';
import 'package:fluttertest/modules/auth/model/login_model.dart';
import 'package:fluttertest/modules/auth/model/register_model.dart';

import '../../../core/error/failure.dart';
import '../../../modules/auth/model/user_model.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, UserModel>> login(LoginModel loginModel);
  Future<Either<Failure, UserModel>> register(RegisterModel registerModel);
  Future<void> setUser(UserModel userModel);
  Future<bool> checkIfLogin();
  Future<UserModel> getUser();
}
