import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class LoginModel extends Equatable {
  final String email;
  final String password;

  const LoginModel({required this.email, required this.password});

  Future<http.MultipartRequest> toJson(String url) async {
    final req = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['email'] = email
      ..fields['password'] = password;
    return req;
  }

  @override
  List<Object?> get props => [email, password];
}
