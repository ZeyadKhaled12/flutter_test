import 'package:either_dart/either.dart';
import 'package:fluttertest/core/error/failure.dart';
import 'package:fluttertest/data/datasource/auth_remote_data_source.dart';
import 'package:fluttertest/data/repository/auth_repos/base_auth_repo.dart';
import 'package:fluttertest/modules/auth/model/login_model.dart';
import 'package:fluttertest/modules/auth/model/register_model.dart';

import '../../../core/error/exception.dart';
import '../../../modules/auth/model/user_model.dart';
import '../../local/preference_manager.dart';

class AuthRepo extends BaseAuthRepo {
  BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  BasPreferenceManager basPreferenceManager;

  AuthRepo(this.baseAuthRemoteDataSource, this.basPreferenceManager);
  @override
  Future<Either<Failure, UserModel>> login(LoginModel loginModel) async {
    try {
      final result = await baseAuthRemoteDataSource.login(loginModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      RegisterModel registerModel) async {
    try {
      final result = await baseAuthRemoteDataSource.register(registerModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<bool> checkIfLogin() async {
    return await basPreferenceManager.checkIfLogin();
  }

  @override
  Future<void> setUser(UserModel userModel) async {
    await basPreferenceManager.setUser(userModel);
  }

  @override
  Future<UserModel> getUser() async {
    return await basPreferenceManager.getUser();
  }
}
