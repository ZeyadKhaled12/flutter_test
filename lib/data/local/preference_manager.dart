import 'dart:convert';

import '../../modules/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BasPreferenceManager {
  Future<void> setUser(UserModel userModel);
  Future<UserModel> getUser();
  Future<void> logOut();
  Future<bool> checkIfLogin();
}

class PreferenceManager extends BasPreferenceManager {
  @override
  Future<bool> checkIfLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('is_login_before')) {
      return preferences.getBool('is_login_before')!;
    }
    return false;
  }

  @override
  Future<void> setUser(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('user', jsonEncode(userModel.toJson()));
    await preferences.setBool('is_login_before', true);
  }

  @override
  Future<UserModel> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    UserModel userModel =
        UserModel.fromJson(jsonDecode(preferences.getString('user')!));
    return userModel;
  }

  @override
  Future<void> logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('is_login_before', false);
  }
}
