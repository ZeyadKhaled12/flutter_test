import 'package:fluttertest/core/enums.dart';
import 'package:fluttertest/data/datasource/auth_remote_data_source.dart';
import 'package:fluttertest/data/local/preference_manager.dart';
import 'package:fluttertest/data/repository/auth_repos/auth_repo.dart';
import 'package:fluttertest/data/repository/auth_repos/base_auth_repo.dart';
import 'package:fluttertest/modules/auth/model/login_model.dart';
import 'package:fluttertest/modules/auth/model/register_model.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class AuthController extends GetxController {
  BaseAuthRepo repo = AuthRepo(AuthRemoteDataSource(), PreferenceManager());
  var requestState = RequestState.loaded.obs;
  var userModel = const UserModel(
          name: '', email: '', countryCode: '', phone: '', token: '', id: '')
      .obs;
  var errorMessage = ''.obs;

  onChangedUserModel(UserModel userModel) {
    this.userModel.value = userModel;
  }

  Future<void> login(LoginModel loginModel) async {
    requestState.value = RequestState.loading;
    final result = await repo.login(loginModel);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) async {
      userModel.value = r;
      await repo.setUser(r);
      requestState.value = RequestState.loaded;
    });
  }

  Future<bool> checkIfLogin() async {
    requestState.value = RequestState.loading;
    return await repo.checkIfLogin().then((value) {
      requestState.value = RequestState.loading;
      return value;
    });
  }

  Future<UserModel> getUser() async {
    requestState.value = RequestState.loading;
    return await repo.getUser().then((value) {
      requestState.value = RequestState.loading;
      return value;
    });
  }

  Future<void> register(RegisterModel registerModel) async {
    requestState.value = RequestState.loading;
    final result = await repo.register(registerModel);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) async {
      userModel.value = r;
      await repo.setUser(r);
      requestState.value = RequestState.loaded;
    });
  }
}
