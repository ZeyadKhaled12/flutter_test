import 'package:either_dart/either.dart';
import '../../../core/error/failure.dart';
import '../../../modules/auth/model/user_model.dart';
import '../../../modules/home/model/update_info_model.dart';
import '../../../modules/home/model/update_password_model.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure, UserModel>> updateInfo(
      UpdateInfoModel updateInfoModel);
  Future<Either<Failure, void>> updatePassword(
      UpdatePasswordModel updatePasswordModel);
  Future<Either<Failure, void>> deleterUser(String token);
  Future<void> updatePrefUser(UserModel userModel);
  Future<void> logOut();
}
