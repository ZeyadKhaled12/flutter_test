import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/app_constance.dart';
import '../../core/error/error_message_model.dart';
import '../../core/error/exception.dart';
import '../../modules/auth/model/login_model.dart';
import '../../modules/auth/model/register_model.dart';
import '../../modules/auth/model/user_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> login(LoginModel loginModel);
  Future<UserModel> register(RegisterModel registerModel);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<UserModel> login(LoginModel loginModel) async {
    if (loginModel.email.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Email is required'));
    } else if (loginModel.password.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Password is required'));
    }
    final req = await loginModel.toJson(AppConstance.loginApi);
    req.headers['Accept'] = 'application/json';
    req.headers['Content-Type'] = 'application/json';

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    Map<String, dynamic> resMap = jsonDecode(res.body);
    if (res.statusCode == 200 || resMap['success']) {
      return UserModel.fromJson(resMap['data']);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(resMap));
    }
  }

  @override
  Future<UserModel> register(RegisterModel registerModel) async {
    if (registerModel.name.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Name is required'));
    } else if (registerModel.phone.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Phone is required'));
    } else if (registerModel.email.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Email is required'));
    } else if (registerModel.password.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Password is required'));
    } else if (registerModel.passwordConfirm.isEmpty) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Confirm Password is required'));
    }
    final req = await registerModel.toJson(AppConstance.registerApi);
    req.headers['Accept'] = 'application/json';
    req.headers['Content-Type'] = 'application/json';

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    Map<String, dynamic> resMap = jsonDecode(res.body);
    if (res.statusCode == 200 || resMap['success']) {
      return UserModel.fromJson(resMap['data']);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(resMap));
    }
  }
}
