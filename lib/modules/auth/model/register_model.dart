import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class RegisterModel extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String countryCode;
  final String password;
  final String passwordConfirm;

  const RegisterModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
    required this.password,
    required this.passwordConfirm,
  });

  Future<http.MultipartRequest> toJson(String url) async {
    final req = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['name'] = name
      ..fields['email'] = email
      ..fields['phone'] = phone
      ..fields['password'] = password
      ..fields['country_code'] = countryCode
      ..fields['password_confirm'] = passwordConfirm;
    return req;
  }

  @override
  List<Object?> get props =>
      [name, email, phone, password, countryCode, passwordConfirm];
}
