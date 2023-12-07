import 'dart:convert';

import '../../core/app_constance.dart';
import '../../core/error/error_message_model.dart';
import '../../core/error/exception.dart';
import 'package:http/http.dart' as http;

import '../../modules/auth/model/user_model.dart';
import '../../modules/home/model/update_info_model.dart';
import '../../modules/home/model/update_password_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<UserModel> updateInformation(UpdateInfoModel updateInfoModel);
  Future<void> updatePassword(UpdatePasswordModel updatePasswordModel);
  Future<void> deleteUser(String token);
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  @override
  Future<UserModel> updateInformation(UpdateInfoModel updateInfoModel) async {
    if (updateInfoModel.name.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Name is required'));
    } else if (updateInfoModel.phone.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Phone is required'));
    } else if (updateInfoModel.email.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Email is required'));
    }
    final req = await updateInfoModel.toJson(AppConstance.updateInfoApi);
    req.headers['Accept'] = 'application/json';
    req.headers['Content-Type'] = 'application/json';
    req.headers['Authorization'] = updateInfoModel.token;

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    Map resMap = jsonDecode(res.body);
    if (res.statusCode == 200 || resMap['success']) {
      return UserModel.fromJson(resMap['data'], token: updateInfoModel.token);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(jsonDecode(res.body)));
    }
  }

  @override
  Future<void> updatePassword(UpdatePasswordModel updatePasswordModel) async {
    if (updatePasswordModel.currentPassword.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Current Password is required'));
    } else if (updatePasswordModel.newPassword.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'New Password is required'));
    } else if (updatePasswordModel.passwordConfirm.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Confirm Password is required'));
    }
    final req =
        await updatePasswordModel.toJson(AppConstance.updatePasswordApi);
    req.headers['Accept'] = 'application/json';
    req.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    req.headers['Authorization'] = updatePasswordModel.token;

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    if (res.statusCode != 200) {
      throw ServerException(ErrorMessageModel.fromJson(jsonDecode(res.body)));
    }
    // final req = await http.post(Uri.parse(AppConstance.updatePasswordApi),
    //     headers: {
    //       'Accept': 'application/json',
    //       'Content-Type': 'application/x-www-form-urlencoded',
    //       'Authorization': updatePasswordModel.token
    //     },
    //     body: jsonEncode(updatePasswordModel.toJson()));
    // Map<String, dynamic> res = jsonDecode(req.body);
    // if (req.statusCode == 200) {
    //   print(res);
    //   return UserModel.fromJson(res['data'], token: updatePasswordModel.token);
    // } else {
    //   print(res);
    //   throw ServerException(ErrorMessageModel.fromJson(res));
    // }
  }

  @override
  Future<void> deleteUser(String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token
    };

    final url = Uri.parse(AppConstance.deleteUserApi);

    final res = await http.delete(url, headers: headers);
    if (res.statusCode != 200) {
      throw ServerException(ErrorMessageModel.fromJson(jsonDecode(res.body)));
    }
  }
}
