import 'package:either_dart/either.dart';
import 'package:fluttertest/core/error/failure.dart';
import 'package:fluttertest/data/datasource/home_remote_data_source.dart';
import 'package:fluttertest/data/local/preference_manager.dart';
import 'package:fluttertest/data/repository/home_repos.dart/base_home_repo.dart';
import 'package:fluttertest/modules/home/model/update_info_model.dart';
import 'package:fluttertest/modules/home/model/update_password_model.dart';

import '../../../core/error/exception.dart';
import '../../../modules/auth/model/user_model.dart';

class HomeRepo extends BaseHomeRepo {
  BaseHomeRemoteDataSource baseHomeRemoteDataSource;
  BasPreferenceManager basPreferenceManager;
  HomeRepo(this.baseHomeRemoteDataSource, this.basPreferenceManager);

  @override
  Future<Either<Failure, UserModel>> updateInfo(
      UpdateInfoModel updateInfoModel) async {
    try {
      final result =
          await baseHomeRemoteDataSource.updateInformation(updateInfoModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updatePassword(
      UpdatePasswordModel updatePasswordModel) async {
    try {
      final result =
          await baseHomeRemoteDataSource.updatePassword(updatePasswordModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleterUser(String token) async {
    try {
      final result = await baseHomeRemoteDataSource.deleteUser(token);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<void> updatePrefUser(UserModel userModel) async {
    await basPreferenceManager.setUser(userModel);
  }

  @override
  Future<void> logOut() async {
    await basPreferenceManager.logOut();
  }
}
