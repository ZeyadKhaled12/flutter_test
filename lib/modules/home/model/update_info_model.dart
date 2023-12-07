import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class UpdateInfoModel extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String countryCode;
  final String token;

  const UpdateInfoModel(
      {required this.token,
      required this.name,
      required this.email,
      required this.phone,
      required this.countryCode});

  Future<http.MultipartRequest> toJson(String url) async {
    final req = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['name'] = name
      ..fields['email'] = email
      ..fields['phone'] = phone
      ..fields['country_code'] = countryCode;
    return req;
  }

  @override
  List<Object?> get props => [token, name, email, phone, countryCode];
}
