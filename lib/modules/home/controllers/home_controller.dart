import 'package:fluttertest/data/datasource/home_remote_data_source.dart';
import 'package:fluttertest/data/local/preference_manager.dart';
import 'package:fluttertest/data/repository/home_repos.dart/home_repo.dart';
import 'package:fluttertest/modules/home/model/update_info_model.dart';
import 'package:fluttertest/modules/home/model/update_password_model.dart';
import 'package:get/get.dart';

import '../../../core/enums.dart';
import '../../../data/repository/home_repos.dart/base_home_repo.dart';
import '../../auth/model/user_model.dart';

class HomeController extends GetxController {
  var requestState = RequestState.loaded.obs;
  var userModel = const UserModel(
          name: '', email: '', countryCode: '', phone: '', token: '', id: '')
      .obs;
  BaseHomeRepo repo = HomeRepo(HomeRemoteDataSource(), PreferenceManager());
  var errorMessage = ''.obs;

  onChanged(UserModel userModel) => this.userModel.value = userModel;

  Future<void> updateInfo(UpdateInfoModel updateInfoModel) async {
    requestState.value = RequestState.loading;
    final result = await repo.updateInfo(updateInfoModel);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) async {
      userModel.value = r;
      await repo.updatePrefUser(r);
      requestState.value = RequestState.loaded;
    });
  }

  Future<void> updatePassword(UpdatePasswordModel updatePasswordModel) async {
    requestState.value = RequestState.loading;
    final result = await repo.updatePassword(updatePasswordModel);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) async {
      userModel.value = r;
      requestState.value = RequestState.loaded;
    });
  }

  Future<void> logOut() async {
    await repo.logOut();
  }

  Future<void> deleteUser(String token) async {
    requestState.value = RequestState.loading;
    final result = await repo.deleterUser(token);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) async {
      await logOut();
      requestState.value = RequestState.loaded;
    });
  }
}
