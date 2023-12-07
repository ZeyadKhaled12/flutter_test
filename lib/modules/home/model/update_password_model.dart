import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class UpdatePasswordModel extends Equatable {
  final String newPassword;
  final String passwordConfirm;
  final String currentPassword;
  final String token;

  const UpdatePasswordModel(
      {required this.newPassword,
      required this.passwordConfirm,
      required this.currentPassword,
      required this.token});

  Future<http.MultipartRequest> toJson(String url) async {
    final req = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['password'] = newPassword
      ..fields['password_confirm'] = passwordConfirm
      ..fields['current_password'] = currentPassword;
    return req;
  }

  // Map<String, dynamic> toJson() => {
  //       'password': newPassword,
  //       'password_confirm': passwordConfirm,
  //       'current_password': currentPassword
  //     };

  @override
  List<Object?> get props => [newPassword, passwordConfirm, currentPassword];
}
